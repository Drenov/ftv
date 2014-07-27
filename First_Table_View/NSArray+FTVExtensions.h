//
//  NSArray+FTVExtensions.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/29/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FTVExtensions)

- (NSArray *)knuthShuffledArray;

@end

@interface NSMutableArray (FTVExtensions)

- (void)knuthShuffle;

@end
