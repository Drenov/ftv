//
//  NSFileManager+FTVExtensions.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/16/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "NSFileManager+FTVExtensions.h"

static NSString	*const kFTVCacheFolder = @"FTVImageCache";
static NSString	*const kFTVDataFolder = @"FTVData";

@implementation NSFileManager (FTVExtensions)

+ (NSString *)homeDirectoryPathWithPathComponent:(NSString*)component {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:component];

    return path;
}

+ (NSString *)cacheDirectoryPath {
    return [self homeDirectoryPathWithPathComponent:kFTVCacheFolder];
}

+ (NSString *)dataDirectoryPath {
    return [self homeDirectoryPathWithPathComponent:kFTVDataFolder];
}

+ (NSURL *)dataDirectoryUrl {
    return [NSURL fileURLWithPath:[self dataDirectoryPath]] ;
}


+ (void)createCacheDirectory {
    NSFileManager *fileManager = [self defaultManager];
    NSString *cacheDirectory = [self cacheDirectoryPath];
    if (![fileManager fileExistsAtPath:cacheDirectory])
    {
        [fileManager createDirectoryAtPath:cacheDirectory
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    }
}

+ (void)createDataDirectory {
    NSFileManager *fileManager = [self defaultManager];
    NSString *dataDirectory = [self dataDirectoryPath];
    if (![fileManager fileExistsAtPath:dataDirectory])
    {
        [fileManager createDirectoryAtPath:dataDirectory
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    }
}

+ (BOOL)fileExistsAtPath:(NSString *)path {
    return [[self defaultManager] fileExistsAtPath:path];
}

@end
