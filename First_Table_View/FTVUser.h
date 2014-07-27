//
//  FTVHandlingObject.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/29/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDPModel.h"

@class FTVImageModel;

@interface FTVUser : IDPModel <NSCoding>
@property (nonatomic, copy)		NSString		*firstName;
@property (nonatomic, copy)		NSString		*lastName;
@property (nonatomic, copy)     NSString        *userID;

@property (nonatomic, copy)     NSString        *city;
@property (nonatomic, copy)     NSString        *country;

@property (atomic, retain)      FTVImageModel   *previewPicture;
@property (atomic, retain)      FTVImageModel   *largePicture;

@end
