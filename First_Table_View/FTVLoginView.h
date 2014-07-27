//
//  FTVLoginView.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "FTVView.h"

@interface FTVLoginView : FTVView
@property (nonatomic, retain)   IBOutlet    FBLoginView                 *loginView;
@property (nonatomic, retain)   IBOutlet    FBProfilePictureView        *profilePictureView;

@property (nonatomic, retain)   IBOutlet    UILabel                     *label;
@property (nonatomic, retain)   IBOutlet    UIButton                    *showFriends;
@property (nonatomic, retain)   IBOutlet    UIButton                    *showCancel;
@property (nonatomic, retain)   IBOutlet    UIActivityIndicatorView     *indicator;

@property (nonatomic, assign)       BOOL        showFriendsEnabled;
@property (nonatomic, assign)       BOOL        showCancelHidden;

@end
