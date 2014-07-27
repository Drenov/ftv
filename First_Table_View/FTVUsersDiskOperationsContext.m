//
//  FTVUsersDiskOperationsContext.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/16/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVUsersDiskOperationsContext.h"
#import "FTVUsers.h"

#import "NSObject+IDPExtensions.h"

#import "NSFileManager+FTVExtensions.h"
#import "FTVBlock.h"

static NSString	*const kFTVStorageFileName	= @"users.plist";

@interface FTVUsersDiskOperationsContext ()
@property (nonatomic, readonly)     NSString        *path;

@end

@implementation FTVUsersDiskOperationsContext

@dynamic path;

#pragma mark -
#pragma mark Class Methods

+ (BOOL)saveToDisk:(FTVUsers *)users {
    FTVUsersDiskOperationsContext *context = [self object];
    BOOL isDone = [NSKeyedArchiver archiveRootObject:users.users toFile:context.path];
	if (!isDone) {
		NSLog(@"Error. Data not saved.");
        
        return NO;
	}
    
    NSLog(@"Data saved");
    
    return YES;
}

+ (BOOL)loadFromDisk:(FTVUsers *)users {
    FTVUsersDiskOperationsContext *context = [self object];
    NSString *path = context.path;
	NSLog(@"Checking saved data at %@", path);
	if (![NSFileManager fileExistsAtPath:path]) {
		NSLog(@"No saved data found");
        [users failLoading];
		
		return NO;
	};
	
	NSLog(@"Saved data found, loading");
    FTVPerformBlockInBackground(^{
        NSArray *loadedData = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        for (id user in loadedData) {
            [users addObject:user];
        }
        
        NSLog(@"Saved data loading done");
        FTVPerformBlockOnMainQueue(^{
            [users finishLoading];
        });
    });
	
	return YES;
}

#pragma mark -
#pragma mark Accessors 

- (NSString *)path {
	NSString *path = [NSFileManager homeDirectoryPathWithPathComponent:kFTVStorageFileName];
    
	return path;
}

@end
