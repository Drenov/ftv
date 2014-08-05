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

typedef enum {
    kFTVLoginFailed,
    kFTVLoginSucceed
} kFTVLoginState;

@interface FTVLoginView : FTVView
@property (nonatomic, retain)   IBOutlet    FBLoginView                 *loginView;
@property (nonatomic, retain)   IBOutlet    FBProfilePictureView        *profilePictureView;

@property (nonatomic, retain)   IBOutlet    UILabel                     *loginLabel;
@property (nonatomic, retain)   IBOutlet    UIButton                    *showFriendsButton;
@property (nonatomic, retain)   IBOutlet    UIActivityIndicatorView     *activityIndicator;

@property (nonatomic, assign)       kFTVLoginState          loginState;
//@property (nonatomic, assign)       BOOL        showFriendsEnabled;

@end
