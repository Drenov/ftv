//
//  FTVImageCache.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/12/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVImageCache.h"
#import "IDPWeakReference.h"

static FTVImageCache *__imageCache = nil;

@interface FTVImageCache ()
@property (atomic, retain)      NSMutableDictionary     *urlCache;

@end

@implementation FTVImageCache

#pragma mark -
#pragma mark Class Methods

 + (id)sharedObject {
     static dispatch_once_t __cacheOnceToken;
     dispatch_once(&__cacheOnceToken, ^{
     __imageCache = [[self alloc] init];
     });
     
    NSLog(@"Singltone requested");
     
    return __imageCache;
 }

+ (id)__sharedObject {
    return __imageCache;
}

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.urlCache = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        self.urlCache = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)addImageModel:(FTVImageModel *)imageModel forUrl:(NSURL *)url {
    if (!url) {
        NSLog(@"Error. The Key url is empty");
        
        return;
    }
    
    id syncObject = self.urlCache;
	@synchronized(syncObject) {
        IDPWeakReference *reference = [IDPWeakReference referenceWithObject:imageModel];
        [syncObject setObject:reference forKey:url];
        NSLog(@"Image key added to cache");
    }
}

- (void)removeImageModelForUrl:(NSURL *)url {
    if (!url) {
        return;
    }
    
    id syncObject = self.urlCache;
	@synchronized(syncObject) {
        [syncObject removeObjectForKey:url];
        NSLog(@"Image key removed from cache");
    }
}

- (FTVImageModel *)imageModelForUrl:(NSURL *)url {
    IDPWeakReference *reference = [self.urlCache objectForKey:url];
    id object = reference.object;
    if (object) {
        NSLog(@"Image key fetched from cache");

        return object;
    }
    
    NSLog(@"Cached image key not found");
    
    return nil;
}

@end
