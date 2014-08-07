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

static NSString *const kFTVUserIdPredicateFormat = @"userID = %@";

@class FTVCoreUser;

@implementation FTVUsersReadContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    NSString *userId = ((FTVCoreUser *)self.object).userID;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:kFTVUserIdPredicateFormat, userId];
    NSArray *reply = [FTVCoreUser fetchEntityWithSortDescriptors:nil
                                                       predicate:predicate
                                                   prefetchPaths:nil];
    FTVCoreUser *user = [reply lastObject];
    if (![[user.friends allObjects] count]) {
        [self.object failLoading];
        
        return;
    }
    
    [self.object finishLoading];
}

@end
