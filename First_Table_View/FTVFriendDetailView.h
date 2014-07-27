//
//  FTVFriendDetailView.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/21/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTVView.h"

@class FTVImageView;

@interface FTVFriendDetailView : FTVView

@property (nonatomic, retain)   IBOutlet    UILabel         *name;
@property (nonatomic, retain)   IBOutlet    UILabel         *country;
@property (nonatomic, retain)   IBOutlet    UILabel         *city;

@property (nonatomic, retain)   IBOutlet    FTVImageView    *picture;

@end
