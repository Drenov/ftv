//
//  FTVLoginView.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVLoginView.h"

@implementation FTVLoginView

@synthesize showFriendsEnabled = _showFriendsEnabled;

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

- (void)setShowFriendsEnabled:(BOOL)showFriendsEnabled {
    _showFriendsEnabled = showFriendsEnabled;
    self.showFriendsButton.enabled = showFriendsEnabled;
}

#pragma mark-
#pragma mark Public Methods

- (void)fillWithModel:(id<FBGraphUser>)model {
    self.profilePictureView.profileID = model.objectID;
    if (model) {
        self.loginLabel.text = [NSString stringWithFormat:@"Logged as %@", model.name];
    } else {
        self.showFriendsEnabled = NO;
        self.loginLabel.text = @"Please login";
    }
}

@end
