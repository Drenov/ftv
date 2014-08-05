//
//  FTVCoreUser.h
//  First_Table_View
//
//  Created by Dren Drenov on 8/5/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FTVCoreUser;

@interface FTVCoreUser : NSManagedObject
@property (nonatomic, retain)       NSString        *city;
@property (nonatomic, retain)       NSString        *country;
@property (nonatomic, retain)       NSString        *firstName;
@property (nonatomic, retain)       NSString        *picturePath;
@property (nonatomic, retain)       NSString        *lastName;
@property (nonatomic, retain)       NSString        *previewPicturePath;
@property (nonatomic, retain)       NSString        *userID;
@property (nonatomic, retain)       NSSet           *friends;

@end

@interface FTVCoreUser (CoreDataGeneratedAccessors)

- (void)addFriendsObject:(FTVCoreUser *)value;
- (void)removeFriendsObject:(FTVCoreUser *)value;
- (void)addFriends:(NSSet *)values;
- (void)removeFriends:(NSSet *)values;

@end
