//
//  FTVModels.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/17/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDPModel.h"

@class FTVCoreUser;

@interface FTVUserModels : IDPModel
@property (nonatomic, readonly)		NSArray		*userModels;

- (void)addObject:(FTVCoreUser *)user;
- (void)removeAllObjects;

- (void)removeObjectAtIndex:(NSInteger)index;
- (void)moveObjectAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

- (FTVCoreUser *)objectAtIndex:(NSInteger)index;
- (NSUInteger)count;

@end
