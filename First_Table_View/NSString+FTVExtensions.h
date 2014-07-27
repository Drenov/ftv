//
//  NSString+FTVExtensions.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/28/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FTVExtensions)

+ (NSString *)randomStringWithLength:(NSUInteger)lenth;

- (NSString *)MD5String;

@end
