//
//  FTVDiskOperationsContext.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/23/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVUsersContext.h"

@interface FTVDiskOperationsContext : FTVUsersContext
@property (nonatomic, readonly)     NSString        *path;

// This is an abstract subclass, which
// should never be instantiated directly

@end
