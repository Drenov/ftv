//
//  UIWindow+FTVExtensions.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/30/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (FTVExtensions)

+ (UIWindow *)window;

+ (UIWindow *)windowWithRootViewController:(UIViewController*)controller;

@end
