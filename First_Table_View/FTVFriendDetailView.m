//
//  FTVFriendDetailView.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/21/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVFriendDetailView.h"
#import "FTVImageModel.h"
#import "FTVImageView.h"
#import "FTVCoreUser.h"
#import "FTVCoreUser+FTVExtension.h"

@implementation FTVFriendDetailView

#pragma mark#import "FTVCoreUser+FTVExtension.h"

#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    self.country = nil;
    self.city = nil;
    self.picture = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(FTVCoreUser *)user {
    NSString *name = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    self.name.text = name;
    self.city.text = user.city;
    self.country.text = user.country;
    FTVImageModel *picture = user.largePicture;
    if (!picture) {
        picture = user.previewPicture;
    }
    
    [self.picture fillWithModel:picture];
    NSLog(@"User %@ detail view updated", name);
}

@end
