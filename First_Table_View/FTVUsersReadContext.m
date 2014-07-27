//
//  FTVUsersReadOperationContext.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVUsersReadContext.h"
#import "FTVCoreUser.h"
#import "IDPActiveRecordKit.h"

@class FTVCoreUser;

@implementation FTVUsersReadContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    NSArray *reply = [FTVCoreUser fetchEntityWithSortDescriptors:nil
                                                       predicate:nil
                                                   prefetchPaths:nil];
    if (![reply count]) {
        [self failLoading];
        
        return;
    }
    
    [(NSMutableArray *)self.object setArray:reply];
    [self finishLoading];
}

@end
