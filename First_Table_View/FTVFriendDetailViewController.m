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
#import "FTVFacebookUserDetailsContext.h"

@interface FTVFriendDetailViewController ()
@property (nonatomic, retain)       FTVFacebookUserDetailsContext       *detailsContext;
@property (nonatomic, readonly)     FTVFriendDetailView                 *customView;

@end

@implementation FTVFriendDetailViewController

@dynamic customView;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.detailsContext = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [self.customView fillWithModel:self.usersModel];
    
    [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.detailsContext = nil;
    [self.customView.imageView.imageModel cancel];

    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [self.customView.imageView.imageModel dump];
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Accessors

- (FTVFriendDetailView *)customView {
    id view = self.view;
	if ([self isViewLoaded] && [view isKindOfClass:[FTVFriendDetailView class]]) {
		return (FTVFriendDetailView *)view;
	}
	
	return nil;
}

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
        [self.customView fillWithModel:user];
        self.detailsContext = nil;
    }
}

- (void)modelDidFailToLoad:(id)theModel {
    if (theModel == self.detailsContext) {
        FTVCoreUser *user = self.usersModel;
        NSLog(@"User %@ details failed to load", user.firstName);
        [self.customView fillWithModel:user];
        self.detailsContext = nil;
    }
}

@end
