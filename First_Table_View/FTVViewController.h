//
//  FTVViewController.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/26/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDPModelProtocol.h"

@interface FTVViewController : UIViewController
@property (nonatomic, retain)       id<IDPModel>        object;

@end
