//
//  FTVMainView.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/16/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVFriendsView.h"

@implementation FTVFriendsView

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
	self.tableView = nil;
    
	[super dealloc];
}

@end
