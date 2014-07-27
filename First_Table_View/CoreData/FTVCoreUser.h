//
//  FTVCoreUser.h
//  First_Table_View
//
//  Created by Dren Drenov on 7/6/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface FTVCoreUser : NSManagedObject

@property (nonatomic, retain)       NSString            *firstName;
@property (nonatomic, retain)       NSString            *lastName;
@property (nonatomic, retain)       NSString            *userID;
@property (nonatomic, retain)       NSString            *city;
@property (nonatomic, retain)       NSString            *country;
@property (nonatomic, retain)       NSString            *previewPicturePath;
@property (nonatomic, retain)       NSString            *largePicturePath;

@end
