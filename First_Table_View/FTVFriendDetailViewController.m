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
#import "FTVCoreUser+FTVExtension.h"
#import "FTVImageView.h"
#import "FTVFacebookUserDetailsContext.h"

#import "IDPPropertyMacros.h"
#import "UIViewController+IDPExtensions.h"

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
    [self.friendDetailView fillWithModel:self.object];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Accessors

IDPViewControllerViewOfClassGetterSynthesize(FTVFriendDetailView, friendDetailView);

- (void)setObject:(FTVCoreUser *)user {
    [super setObject:user];
    FTVFacebookUserDetailsContext *context = [FTVFacebookUserDetailsContext contextWithObject:user];
    self.detailsContext = context;
    [context execute];
}

- (void)setDetailsContext:(FTVFacebookUserDetailsContext *)detailsContext {
    if (detailsContext != _detailsContext) {
        [_detailsContext cancel];
    }
    
    IDPNonatomicRetainPropertySynthesize(_detailsContext, detailsContext);
}

#pragma mark-
#pragma mark IDPModelObserver

- (void)modelDidLoad:(id)theModel {
    if (theModel == self.object) {
        FTVCoreUser *user = self.object;
        NSLog(@"User %@ details did load", user.firstName);
        [self.friendDetailView fillWithModel:user];
        self.detailsContext = nil;
    }
}

- (void)modelDidFailToLoad:(id)theModel {
    if (theModel == self.object) {
        FTVCoreUser *user = self.object;
        NSLog(@"User %@ details failed to load", user.firstName);
        [self.friendDetailView fillWithModel:user];
        self.detailsContext = nil;
    }
}

@end
