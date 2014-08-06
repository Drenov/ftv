//
//  FTVFriendDetailViewController.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/21/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVFriendDetailViewController.h"
#import "FTVFriendDetailView.h"
#import "FTVCoreUser.h"
#import "FTVImageView.h"
#import "IDPPropertyMacros.h"
#import "UIViewController+IDPExtensions.h"
#import "FTVFacebookUserDetailsContext.h"

@interface FTVFriendDetailViewController ()
@property (nonatomic, retain)       FTVFacebookUserDetailsContext       *detailsContext;
@property (nonatomic, readonly)     FTVFriendDetailView                 *friendDetailView;

@end

@implementation FTVFriendDetailViewController

@dynamic friendDetailView;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.detailsContext = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [self.friendDetailView fillWithModel:self.usersModel];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [self.friendDetailView.imageView.imageModel dump];
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Accessors

IDPViewControllerViewOfClassGetterSynthesize(FTVFriendDetailView, friendDetailView);

- (void)setUsersModel:(FTVCoreUser *)user {
    [super setUsersModel:user];
    FTVFacebookUserDetailsContext *context = [FTVFacebookUserDetailsContext contextWithObject:user];
    self.detailsContext = context;
    [context execute];
}

- (void)setDetailsContext:(FTVFacebookUserDetailsContext *)detailsContext {
    if (detailsContext != _detailsContext) {
        [_detailsContext cancel];
    }
    
    IDPNonatomicRetainPropertySynthesizeWithObserver(_detailsContext, detailsContext);
}

#pragma mark-
#pragma mark IDPModelObserver

- (void)modelDidLoad:(id)theModel {
    if (theModel == self.detailsContext) {
        FTVCoreUser *user = self.usersModel;
        NSLog(@"User %@ details did load", user.firstName);
        [self.friendDetailView fillWithModel:user];
        self.detailsContext = nil;
    }
}

- (void)modelDidFailToLoad:(id)theModel {
    if (theModel == self.detailsContext) {
        FTVCoreUser *user = self.usersModel;
        NSLog(@"User %@ details failed to load", user.firstName);
        [self.friendDetailView fillWithModel:user];
        self.detailsContext = nil;
    }
}

@end
