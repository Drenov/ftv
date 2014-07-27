//
//  FTVFacebookContext.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/23/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVUsersContext.h"

@protocol FTVFacebookContextProtocol <NSObject>

@required

- (void)fillObjectWithFacebookData:(FBGraphObject<FBGraphUser> *)data;
- (NSString * )graphPath;

@end

// This is an abstract subclass, which
// should never be instantiated directly

@interface FTVFacebookContext : FTVUsersContext <FTVFacebookContextProtocol>

- (void)cancel;

@end
