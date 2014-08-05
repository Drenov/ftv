//
//  FTVCell.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/30/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FTVImageView;

@interface FTVCell : UITableViewCell
@property (nonatomic, retain)	IBOutlet	UILabel				*label;
@property (nonatomic, retain)	IBOutlet	FTVImageView		*cellImageView;

- (void)fillWithModel:(id)model;

@end
