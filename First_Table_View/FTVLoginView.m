//
//  FTVLoginView.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVLoginView.h"
#import "FTVCoreUser.h"

@implementation FTVLoginView

#pragma mark
#pragma mark Initializations and Deallocationsb

- (void)dealloc {
    self.loginView = nil;
    self.profilePictureView = nil;
    self.loginLabel = nil;
    self.showFriendsButton = nil;
    self.activityIndicator = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

//- (void)setShowFriendsEnabled:(BOOL)showFriendsEnabled {
//    _showFriendsEnabled = showFriendsEnabled;
//    self.showFriendsButton.enabled = showFriendsEnabled;
//}

- (void)setLoginState:(kFTVLoginState)loginState {
    _loginState = loginState;
    
    switch (loginState) {
        case kFTVLoginStarted:
            self.showFriendsButton.enabled = false;
            self.loginLabel.text = @"Logginig in";
            [self.activityIndicator startAnimating];
            
            return;
        case kFTVLoginFailed:
            self.showFriendsButton.enabled = false;
            self.loginLabel.text = @"Please login";
            break;
        case kFTVLoginSucceed:
            self.showFriendsButton.enabled = true;
            break;
        default:
            break;
    }
    [self.activityIndicator stopAnimating];
}

#pragma mark-
#pragma mark Public Methods

- (void)fillWithModel:(FTVCoreUser *)model {
    self.profilePictureView.profileID = model.userID;
    if (model) {
        self.loginLabel.text = [NSString stringWithFormat:@"Logged as %@", model.firstName];
        self.loginState = kFTVLoginSucceed;
    } else {
        self.loginState = kFTVLoginFailed;
    }
}

@end
