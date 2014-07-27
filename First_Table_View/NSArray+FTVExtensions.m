//
//  NSArray+FTVExtensions.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/29/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "NSArray+FTVExtensions.h"

@implementation NSArray (FTVExtensions)

- (NSArray *)knuthShuffledArray {
	NSMutableArray *shuffledArray = [NSMutableArray arrayWithArray:self];
	[shuffledArray knuthShuffle];
	
	return shuffledArray;
}

@end

@implementation NSMutableArray (FTVExtensions)

- (void)knuthShuffle {
	NSUInteger count = [self count];
	for (NSUInteger i = 0; i < count; i++) {
		NSUInteger nElement = count - i;
		NSUInteger n = arc4random_uniform(nElement) + i;
		[self exchangeObjectAtIndex:i withObjectAtIndex:n];
	}
}

@end