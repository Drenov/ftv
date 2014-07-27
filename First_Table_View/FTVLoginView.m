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
    self.label = nil;
    self.showFriends = nil;
    self.showCancel = nil;
    self.indicator = nil; 

    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (void)setShowFriendsEnabled:(BOOL)showFriendsEnabled {
    _showFriendsEnabled = showFriendsEnabled;
    self.showFriends.enabled = showFriendsEnabled;
}

- (void)setShowCancelHidden:(BOOL)showCancelHidden {
    _showCancelHidden = showCancelHidden;
    self.showCancel.hidden = showCancelHidden;
}

#pragma mark-
#pragma mark Public Methods

- (void)fillWithModel:(id<FBGraphUser>)model {
    self.profilePictureView.profileID = model.objectID;
    if (model) {
        self.label.text = [NSString stringWithFormat:@"Logged as %@", model.name];
    } else {
        self.showFriendsEnabled = NO;
        self.label.text = @"Please login";
    }
}

@end
