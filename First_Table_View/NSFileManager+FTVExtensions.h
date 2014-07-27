//
//  NSFileManager+FTVExtensions.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/16/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (FTVExtensions)

+ (NSString *)homeDirectoryPathWithPathComponent:(NSString*)component;

+ (NSString *)cacheDirectoryPath;
+ (NSString *)dataDirectoryPath;

+ (NSURL *)dataDirectoryUrl;

+ (void)createCacheDirectory;
+ (void)createDataDirectory;

+ (BOOL)fileExistsAtPath:(NSString *)path;

@end
