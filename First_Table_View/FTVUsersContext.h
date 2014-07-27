//
//  FTVUsersContext.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "IDPModel.h"

@class FTVUsersModel;

// This is an abstract subclass, which
// should never be instantiated directly

@interface FTVUsersContext : IDPModel
@property (nonatomic, readonly)       id       object;

+ (instancetype)contextWithObject:(id)object;

- (instancetype)initWithObject:(id)object;

// Method intended for overriding in subclasses
- (void)execute;

@end
