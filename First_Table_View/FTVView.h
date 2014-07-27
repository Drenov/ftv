//
//  FTVViewTableViewCell.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/25/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDPModel.h"

// This is an abstract subclass, which
// should never be instantiated directly

@interface FTVView : UIView

- (void)fillWithModel:(id)model;

@end
