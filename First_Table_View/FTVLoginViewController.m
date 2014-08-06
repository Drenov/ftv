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
#import "FTVCoreUser.h"
#import "FTVCoreUser+FTVExtension.h"

static	NSString *const	kFTVReadPermissionPublicProfile = @"public_profile";
static	NSString *const	kFTVReadPermissionUserFriends = @"user_friends";
static	NSString *const	kFTVReadPermissionUserHometown = @"user_hometown";

@interface FTVLoginViewController ()
@property (nonatomic, readonly)         FTVLoginView                *loginView;
@property (nonatomic, retain)           FTVCoreUser                 *loggedInUser;

- (NSArray *)readPermissions;
- (FTVCoreUser *)userFromFBGraphUser:(FBGraphObject<FBGraphUser> *)graphUser;

@end

@implementation FTVLoginViewController

@dynamic loginView;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loggedInUser = nil;
    
    [super dealloc];
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.object = [NSMutableArray array];
//    }
//
//    return self;
//}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    FTVLoginView *view = self.loginView;
    view.loginView.readPermissions = [self readPermissions];
    view.loginState = kFTVLoginStarted;
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"Memory warning!!!");
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Accessors

IDPViewControllerViewOfClassGetterSynthesize(FTVLoginView, loginView);

#pragma mark -
#pragma mark UI Handling Methods

- (IBAction)onShowFriends:(id)sender {
    NSLog(@"Show friends pressed");
    FTVFriendsViewController *controller = [FTVFriendsViewController defaultNibController];
    controller.object = self.loggedInUser;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Private Methods

- (NSArray *)readPermissions {
    NSArray *permissions = [NSArray arrayWithObjects:kFTVReadPermissionPublicProfile,
                                                    kFTVReadPermissionUserFriends,
                                                    kFTVReadPermissionUserHometown,
                                                    nil];
    
    return permissions;
}

- (FTVCoreUser *)userFromFBGraphUser:(FBGraphObject<FBGraphUser> *)graphUser {
    FTVCoreUser *user = [FTVCoreUser userWithId:graphUser.objectID];
    user.firstName = graphUser.first_name;
    user.lastName = graphUser.last_name;
    NSLog(@"Transferred user %@", user.userID);
    [user saveManagedObject];
    
    return user;
}

#pragma mark-
#pragma mark FBLoginViewDelegate

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user
{
    NSLog(@"User info fetched");
    if (!self.loggedInUser) {
        FTVCoreUser *loggedInUser = [self userFromFBGraphUser:(FBGraphObject<FBGraphUser> *)user];
        self.loggedInUser = loggedInUser;
        [self.loginView fillWithModel:loggedInUser];
    }
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    NSLog(@"<<User logged out>>");
    [self.loginView fillWithModel:nil];
    self.loggedInUser = nil;
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSLog(@"FBLoginView error = %@", error);
    self.loginView.loginState = kFTVLoginFailed;
}

@end
