//
//  UINavigationController+FTVExtensions.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "UINavigationController+FTVExtensions.h"

@implementation UINavigationController (FTVExtensions)

+ (UINavigationController *)controllerWithRootViewController:
                                                (UIViewController *)controller
{
    if ([controller isKindOfClass:[UITabBarController class]]) {
        return nil;
    }

    return [[[UINavigationController alloc]
                            initWithRootViewController:controller] autorelease];
}

@end
