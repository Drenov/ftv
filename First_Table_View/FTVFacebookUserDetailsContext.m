//
//  FTVFacebookUserDetailsLoadContext.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/21/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVFacebookUserDetailsContext.h"
#import "FTVCoreUser.h"
#import "FTVCoreUser+FTVExtension.h"

#import "IDPBufferArray.h"

#import "FTVImageModel.h"

#import "IDPActiveRecordKit.h"

#define kFTVFBGraphUserPictureUrlPath [@"picture"][@"data"][@"url"];
#define kFTVFBGraphUserHometownPath [@"hometown"][@"name"];

static	NSString *const	kFTVFBRequestConnectionGraphPathRequest = @"?fields=picture.type(large),hometown";
static	NSString *const	kFTVFBGraphUserHometownSeparator = @", ";

@implementation FTVFacebookUserDetailsContext

#pragma mark -
#pragma mark FTVFacebookContextProtocol

- (void)fillObjectWithFacebookData:(FBGraphObject<FBGraphUser> *)data {
    FTVCoreUser *user = (FTVCoreUser *)self.object;
    NSString *hometown = data kFTVFBGraphUserHometownPath;
    NSArray *components = [hometown componentsSeparatedByString:kFTVFBGraphUserHometownSeparator];
    IDPBufferArray *hometownComponents = [IDPBufferArray arrayWithArray:components];
    user.city = [hometownComponents pop];
    user.country = [hometownComponents componentsJoinedByString:kFTVFBGraphUserHometownSeparator];
    user.largePicturePath = data kFTVFBGraphUserPictureUrlPath;
    [user saveManagedObject];
    NSLog(@"User %@ details filled", user.firstName);
}

- (NSString * )graphPath {
    FTVCoreUser *user = (FTVCoreUser *)self.object;
    return ([NSString stringWithFormat:@"%@%@", user.userID, kFTVFBRequestConnectionGraphPathRequest]);
}

@end
