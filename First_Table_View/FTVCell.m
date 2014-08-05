//
//  FTVCell.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/30/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVCell.h"
#import "FTVImageView.h"
#import "FTVCoreUser.h"
#import "FTVCoreUser+FTVExtension.h"

@implementation FTVCell

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.label = nil;
	self.cellImageView = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)reuseIdentifier {
	return NSStringFromClass([self class]);
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(FTVCoreUser *)model {
	[self.view fillWithModel:model.previewPicture];
    NSString *title = [NSString stringWithFormat:@"%@ %@", model.firstName, model.lastName];
	NSLog(@"User %@ did load to cell", title);
	self.label.text = title;
}

@end
