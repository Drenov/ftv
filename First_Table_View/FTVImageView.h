//
//  FTVImage.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/30/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDPModelObserver.h"
#import "FTVView.h"

@class FTVImageModel;

@interface FTVImageView : FTVView <IDPModelObserver>
@property (nonatomic, retain)	IBOutlet	UIImageView					*imageView;
@property (nonatomic, retain)	IBOutlet	UIActivityIndicatorView		*activityIndicator;

@property (nonatomic, readonly)       FTVImageModel       *imageModel;

@end
