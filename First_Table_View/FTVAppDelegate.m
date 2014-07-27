//
//  FTVAppDelegate.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/16/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVAppDelegate.h"
#import "FTVLoginViewController.h"

#import "UIWindow+FTVExtensions.h"
#import "UINavigationController+FTVExtensions.h"
#import "NSFileManager+FTVExtensions.h"

#import "UIViewController+IDPExtensions.h"
#import "IDPActiveRecordKit.h"

static NSString *const kFTVMomName = @"FTVData";

@implementation FTVAppDelegate

#pragma mark -
#pragma mark UIApplicationDelegate

-				(BOOL)application:(UIApplication *)application
	didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	FTVLoginViewController *loginController = nil;
    UINavigationController *navigationController = nil;
    [IDPCoreDataManager sharedManagerWithMomName:kFTVMomName];
    loginController = [FTVLoginViewController defaultNibController];
    navigationController = [UINavigationController
                            controllerWithRootViewController:loginController];
    
    self.window = [UIWindow windowWithRootViewController:navigationController];
    [self.window makeKeyAndVisible];

	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppEvents activateApp];
    [FBAppCall handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [FBSession.activeSession close];
	NSLog(@"Application exits");
}

-       (BOOL)application:(UIApplication *)application
                  openURL:(NSURL *)url
        sourceApplication:(NSString *)sourceApplication
               annotation:(id)annotation
{
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    return wasHandled;
}

@end
