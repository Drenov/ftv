//
//  FTVLoginView.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVLoginView.h"

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
        case kFTVLoginFailed:
            self.showFriendsButton.enabled = false;
            break;
        case kFTVLoginSucceed:
            self.showFriendsButton.enabled = true;
            self.loginLabel.text = @"Please login";
            break;
        default:
            break;
    }
    [self.activityIndicator stopAnimating];
}

#pragma mark-
#pragma mark Public Methods

- (void)fillWithModel:(id<FBGraphUser>)model {
    self.profilePictureView.profileID = model.objectID;
    if (model) {
        self.loginLabel.text = [NSString stringWithFormat:@"Logged as %@", model.name];
    } else {
        self.loginState = kFTVLoginFailed;
    }
}

@end
