//
//  UIWindow+FTVExtensions.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/30/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "UIWindow+FTVExtensions.h"

@implementation UIWindow (FTVExtensions)

+ (UIWindow *)window {
	return [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
}

+ (UIWindow *)windowWithRootViewController:(UIViewController *)controller {
	UIWindow *window = [self window];
	window.rootViewController = controller;
	
	return window;
}

@end
