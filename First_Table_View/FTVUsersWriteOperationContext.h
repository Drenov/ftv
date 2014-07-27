//
//  FTVUsersWriteOperationContext.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVDiskOperationsContext.h"
#import "IDPModel.h"

@class FTVUsersModel;

@interface FTVUsersWriteOperationContext : IDPModel

+ (instancetype)contextWithUsers:(FTVUsersModel *)users;

- (instancetype)initWithUsers:(FTVUsersModel *)users;

- (void)execute;

@end
