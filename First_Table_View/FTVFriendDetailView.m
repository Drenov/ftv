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

#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.nameLabel = nil;
    self.countryLabel = nil;
    self.cityLabel = nil;
    self.imageView = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(FTVCoreUser *)user {
    NSString *name = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    self.nameLabel.text = name;
    self.cityLabel.text = user.city;
    self.countryLabel.text = user.country;
    FTVImageModel *picture = user.picture;
    if (!picture) {
        picture = user.previewPicture;
    }
    
    [self.imageView fillWithModel:picture];
    NSLog(@"User %@ detail view updated", name);
}

@end
