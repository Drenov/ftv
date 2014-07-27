//
//  FTVModelImage.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 5/15/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVImageModel.h"
#import "FTVImageCache.h"

#import "NSFileManager+FTVExtensions.h"
#import "NSString+FTVExtensions.h"
#import "FTVBlock.h"

#import "UIImage+IDPExtensions.h"
#import "IDPURLConnection.h"
#import "IDPPropertyMacros.h"

static NSString *const kFTVErrorImage = @"exclamation.jpg";

@interface FTVImageModel ()
@property (nonatomic, copy)			NSURL               *url;
@property (nonatomic, retain)		UIImage             *image;
@property (nonatomic, retain)       IDPURLConnection    *connection;

@property (nonatomic, readonly)     NSString            *path;

- (void)saveToDisk;
- (BOOL)loadFromDisk;
- (void)loadFromNetwork;
- (void)performLoading;

@end

@implementation FTVImageModel

@dynamic path;

#pragma mark -
#pragma mark Class Methods

+ (FTVImageModel *)imageModelWithUrl:(NSURL *)url {
    
    return [[[self alloc] initWithUrl:url] autorelease];
}

+ (FTVImageModel *)imageModelWithPath:(NSString *)path {
    
    return [[[self alloc] initWithPath:path] autorelease];
}

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    NSURL *url = self.url;
    [[FTVImageCache sharedObject] removeImageModelForUrl:url];
    url = nil;
	self.image = nil;
    self.connection = nil;
    
    [super dealloc];
}

- (id)initWithUrl:(NSURL *)url {
    if (!url) {
        return nil;
    }
    
    FTVImageCache *cache = [FTVImageCache sharedObject];
    FTVImageModel *imageModel = [cache imageModelForUrl:url];
    if (imageModel) {
        [self autorelease];
        
        return [imageModel retain];
    }
    
    self = [self init];
    if (self) {
        self.url = url;
        [cache addImageModel:self forUrl:url];
    }
    
    return  self;
}

- (id)initWithPath:(NSString *)path {
    NSURL *url = [NSURL URLWithString:path];
    self = [self initWithUrl:url];
    
    return self;
}

#pragma mark-
#pragma mark Accessors

- (NSString *)path {
    NSString *imageName = [[self.url absoluteString] MD5String];;
    NSString *path = [NSFileManager cacheDirectoryPath];
    
    path = [path stringByAppendingPathComponent:imageName];
    
    return path;
}

- (void)setConnection:(IDPURLConnection *)connection {
    if (connection != _connection) {
        [_connection cancel];
    }
    
    IDPNonatomicRetainPropertySynthesizeWithObserver(_connection, connection);
}

#pragma mark-
#pragma mark Private Methods

- (void)saveToDisk {
    FTVPerformBlockInBackground(^{
        NSString *cacheFileName = self.path;
        [NSFileManager createCacheDirectory];
        [self.image writeToFile:cacheFileName atomically:YES inFormat:IDPJPEGImageFile];
        NSLog(@"File %@ cached to disk", [cacheFileName lastPathComponent]);
    });
}

- (BOOL)loadFromDisk {
    NSString *path = self.path;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
		NSLog(@"No cached image found");

		return NO;
	};
    
    FTVPerformBlockInBackground(^{
        self.image = [UIImage imageWithContentsOfFile:path];
        NSLog(@"Image %@ loaded from cache", self.image);
        FTVPerformBlockOnMainQueue(^{
            [self finishLoading];
        });
    });
    
    return YES;
}

- (void)loadFromNetwork {
    NSLog(@"Loading image %@ from network", self);
    IDPURLConnection *connection = [IDPURLConnection connectionToURL:self.url];
    self.connection = connection;
    [connection load];
}

- (void)performLoading {
    if (![self loadFromDisk]) {
        [self loadFromNetwork];
    }
}

#pragma mark-
#pragma mark IDPModel Protocol

- (BOOL)load {
	if ([super load]) {
		[self performLoading];
		
		return YES;
	}
	
    NSLog(@"%@ has been loaded already", [self class]);
    
	return NO;
}

- (void)cleanup {
	NSLog(@"Object %p with url %@ cleanup (Image)", self, [self.url lastPathComponent]);
	self.image = nil;
}

- (void)failLoading {
    [super failLoading];
    self.image = [UIImage imageNamed:kFTVErrorImage];
    [self notifyObserversOfFailedLoad];
}

- (void)cancel {
    self.connection = nil;
}

#pragma mark-
#pragma mark IDPModelObserver Protocol

- (void)modelDidLoad:(IDPURLConnection *)theModel {
    if (theModel == self.connection) {
        NSLog(@"Image %@ network loading done", self);
        UIImage *image = [UIImage imageWithData:theModel.data];
        self.image = image;
        [self saveToDisk];                                          //saveToDisk invocation on main queue only
        [self finishLoading];
        self.connection = nil;
    }
}
    
- (void)modelDidFailToLoad:(id)theModel {
    [self failLoading];
    self.connection = nil;
}

- (void)modelDidCancelLoading:(id)theModel {
    NSLog(@"Image %@ load cancelled", [self.url lastPathComponent]);
    [super cancel];
    self.connection = nil;
}

@end
