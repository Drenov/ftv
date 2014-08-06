//
//  FTVModels.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/17/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVUserModels.h"

@interface FTVUserModels()
@property (nonatomic, retain)       NSMutableArray      *mutableObjects;

@end

@implementation FTVUserModels

@dynamic userModels;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObjects = nil;
	
	[super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray array];
    }
	
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)userModels {
	return [[self.mutableObjects copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addObjects:(NSSet *)users {
    id syncObject = self.mutableObjects;
	@synchronized(syncObject) {
        
    }
}

- (void)removeObjects:(NSSet *)users {
    id syncObject = self.mutableObjects;
	@synchronized(syncObject) {
        
    }
}

- (void)addObject:(id)user {
    id syncObject = self.mutableObjects;
	@synchronized(syncObject) {
		[syncObject addObject:user];
	}
}

- (void)removeAllObjects {
    id syncObject = self.mutableObjects;
	@synchronized(syncObject) {
		[syncObject removeAllObjects];
	}
}

- (void)removeObjectAtIndex:(NSInteger)index {
	id syncObject = self.mutableObjects;
	@synchronized(syncObject) {
		[syncObject removeObjectAtIndex:index];
	}
}

- (void)moveObjectAtIndex:(NSInteger)fromIndex
				  toIndex:(NSInteger)toIndex
{
	if (fromIndex == toIndex) {
		return;
	}
	
	id syncObject = self.mutableObjects;
	@synchronized(syncObject) {
		id movingObject = [[syncObject objectAtIndex:fromIndex] retain];
		[syncObject removeObjectAtIndex:fromIndex];
		[syncObject insertObject:movingObject atIndex:toIndex];
		[movingObject release];
	}
}

- (FTVCoreUser *)objectAtIndex:(NSInteger)index {
    return [self.userModels objectAtIndex:index];
}

- (NSUInteger)count {
    return [self.userModels count];
}

@end
