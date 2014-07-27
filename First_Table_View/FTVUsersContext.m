//
//  FTVUsersContext.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVUsersContext.h"

@interface FTVUsersContext ()
@property (nonatomic, retain)       id       object;

@end

@implementation FTVUsersContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithObject:(id)object {
    if (nil == object) {
        return nil;
    }
    
    return [[[self alloc] initWithObject:object] autorelease];
}

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.object = nil;
    NSLog(@"Context %@ deallocated", [self class]);
    
    [super dealloc];
}

- (instancetype)initWithObject:(id)object{
    self = [self init];
    if (self) {
        self.object = object;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    //perform subclass specific operation
}

@end
