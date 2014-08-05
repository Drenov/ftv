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

@property (nonatomic, retain)   IBOutlet    UILabel         *nameLabel;
@property (nonatomic, retain)   IBOutlet    UILabel         *countryLabel;
@property (nonatomic, retain)   IBOutlet    UILabel         *cityLabel;

@property (nonatomic, retain)   IBOutlet    FTVImageView    *imageView;

@end
