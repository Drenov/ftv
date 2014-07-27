//
//  FTVDiskOperationsContext.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/23/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVDiskOperationsContext.h"
#import "NSFileManager+FTVExtensions.h"

static NSString	*const kFTVStorageFileName	= @"users.plist";

@implementation FTVDiskOperationsContext

@dynamic path;

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
	NSString *path = [NSFileManager homeDirectoryPathWithPathComponent:kFTVStorageFileName];
    
	return path;
}

@end
