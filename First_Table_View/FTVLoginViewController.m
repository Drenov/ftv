//
//  FTVLoginViewController.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVLoginViewController.h"
#import "FTVLoginView.h"
#import "FTVFriendsViewController.h"

#import "UIViewController+IDPExtensions.h"
#import "UIAlertView+IDPExtensions.h"
#import "IDPPropertyMacros.h"

#import "FTVFacebookUsersContext.h"
#import "FTVUsersReadContext.h"

#import "FTVCoreUser.h"//temporary del buuton

#define kFTVFBLoginViewReadPermissions @[@"public_profile", @"user_friends", @"user_hometown"];

static	NSString *const	kFTVLoadingErrorMessage = @"No saved data found. Try again later";


@interface FTVLoginViewController ()
@property (nonatomic, readonly)         FTVLoginView                *customView;

@property (nonatomic, retain)           FTVFacebookUsersContext     *loadContext;
@property (nonatomic, retain)           FTVUsersReadContext         *readContext;

- (void)cleanUsers;

@end

@implementation FTVLoginViewController

@dynamic customView;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadContext = nil;
    self.readContext = nil;
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.usersModel = [NSMutableArray array];
    }

    return self;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    self.customView.loginView.readPermissions = kFTVFBLoginViewReadPermissions;
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"Memory warning!!!");
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Accessors

- (FTVLoginView *)customView {
    id view = self.view;
	if ([self isViewLoaded] && [view isKindOfClass:[FTVLoginView class]]) {
		return (FTVLoginView *)view;
	}
	
	return nil;
}

- (void)setLoadContext:(FTVFacebookUsersContext *)loadContext {
    if (loadContext != _loadContext) {
        [_loadContext cancel];
    }
    
    IDPNonatomicRetainPropertySynthesizeWithObserver(_loadContext, loadContext);
}

- (void)setReadContext:(FTVUsersReadContext *)readContext {
    IDPNonatomicRetainPropertySynthesizeWithObserver(_readContext, readContext);
}

#pragma mark -
#pragma mark UI Handling Methods

- (IBAction)onShowFriends:(id)sender {
    NSLog(@"Show friends pressed");
    FTVFriendsViewController *controller = [FTVFriendsViewController defaultNibController];
    controller.usersModel = self.usersModel;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Private Methods

- (void)cleanUsers {
    [self.usersModel removeAllObjects];
}

#pragma mark-
#pragma mark FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    NSLog(@"<<Showing logged in user>>");
    FTVLoginView *view = self.customView;
    [view.indicator startAnimating];
    FTVFacebookUsersContext *loadContext = [FTVFacebookUsersContext contextWithObject:self.usersModel];
    self.loadContext = loadContext;
    [loadContext execute];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user
{
    NSLog(@"User info fetched");
    [self.customView fillWithModel:user];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    NSLog(@"<<User logged out>>");
    [self.customView fillWithModel:nil];
    [self cleanUsers];
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSLog(@"FBLoginView error = %@", error);
}

#pragma mark-
#pragma mark IDPModelObserver

- (void)modelDidLoad:(id)theModel {
    if (theModel == self.loadContext || theModel == self.readContext) {
        NSLog(@"<<Users did load>>");
        FTVLoginView *view = self.customView;
        [view.indicator stopAnimating];
        view.showFriendsEnabled = YES;
        self.usersModel = ((FTVUsersContext *)theModel).object;
        self.loadContext = nil;
        self.readContext = nil;
    }
}

- (void)modelDidFailToLoad:(id)theModel {
    FTVLoginView *view = self.customView;
    if (theModel == self.loadContext) {
        NSLog(@"Users load failed, reading saved data");
        self.loadContext = nil;
        FTVUsersReadContext *readContext = [FTVUsersReadContext contextWithObject:self.usersModel];
        self.readContext = readContext;
        [readContext execute];
    }
    
    if (theModel == self.readContext) {
        NSLog(@"Users read failed");
        [view.indicator stopAnimating];
        [UIAlertView showErrorWithMessage:kFTVLoadingErrorMessage];
        self.readContext = nil;
    }
}

- (void)modelDidCancelLoading:(id)theModel {
    if (theModel == self.loadContext) {
        NSLog(@"<<Users loading cancelled>>");
        FTVLoginView *view = self.customView;
        [view.indicator stopAnimating];
        self.loadContext = nil;
    }
}

@end
