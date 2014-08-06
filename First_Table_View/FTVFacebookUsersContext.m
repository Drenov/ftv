//
//  FTVFacebookFriendsContext.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/6/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVFacebookUsersContext.h"
#import "FTVCoreUser.h"
#import "FTVCoreUser+FTVExtension.h"
#import "NSObject+IDPExtensions.h"

#define kFTVFBGraphUserPictureUrlPath [@"picture"][@"data"][@"url"];

static	NSString *const	kFTVFBRequestConnectionResultField = @"data";
static	NSString *const	kFTVFBRequestConnectionGraphPathRequest = @"/me/friends?fields=first_name,last_name, picture.type(small)";



@interface FTVFacebookUsersContext()

- (FTVCoreUser *)userFromFBGraphUser:(FBGraphObject<FBGraphUser> *)graphUser;

@end

@implementation FTVFacebookUsersContext

#pragma mark -
#pragma mark Private Methods

- (FTVCoreUser *)userFromFBGraphUser:(FBGraphObject<FBGraphUser> *)graphUser {
    FTVCoreUser *user = [FTVCoreUser userWithId:graphUser.objectID];
    user.firstName = graphUser.first_name;
    user.lastName = graphUser.last_name;
    user.previewPicturePath = graphUser kFTVFBGraphUserPictureUrlPath;
    NSLog(@"Transferred user %@", user.userID);
    [user saveManagedObject];
    
    return user;
}

#pragma mark -
#pragma mark FTVFacebookContextProtocol

- (void)fillObjectWithFacebookData:(FBGraphObject<FBGraphUser> *)data {
    NSArray *usersData = data[kFTVFBRequestConnectionResultField];
    NSLog(@"Filling users with facebook data");
    NSMutableArray *users = self.object;
    FTVCoreUser *user = nil;
    for (FBGraphObject<FBGraphUser> *graphUser in usersData) {
        user = [self userFromFBGraphUser:graphUser];
        [users addObject:user];
    }
}

- (NSString * )graphPath {
    return kFTVFBRequestConnectionGraphPathRequest;
}

@end
