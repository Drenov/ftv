//
//  FTVLoginViewController.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "FTVViewController.h"

@interface FTVLoginViewController : FTVViewController <FBLoginViewDelegate>

- (IBAction)onShowFriends:(id)sender;

@end
