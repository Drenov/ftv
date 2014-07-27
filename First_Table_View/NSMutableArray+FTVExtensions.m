//
//  NSMutableArray+FTVExtensions.m
//  First_Table_View
//
//  Created by Dren Drenov on 7/6/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "NSMutableArray+FTVExtensions.h"

@implementation NSMutableArray (FTVExtensions)

- (void)moveObjectAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    if (fromIndex == toIndex) {
        return;
    }
    
    id syncObject = self;
    @synchronized(self) {
        id movingObject = [[syncObject objectAtIndex:fromIndex] retain];
        [syncObject removeObjectAtIndex:fromIndex];
        [syncObject insertObject:movingObject atIndex:toIndex];
        [movingObject release];
    }
}

@end
