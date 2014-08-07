//
//  FTVCoreUser+FTVExtension.m
//  First_Table_View
//
//  Created by Dren Drenov on 7/6/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVCoreUser+FTVExtension.h"
#import "FTVImageModel.h"
#import "IDPActiveRecordKit.h"

#import "IDPModel.h"
#import "IDPModelMixin.h"
#import "NSObject+IDPExtensions.h"
#import "NSObject+IDPOCExtensions.h"

static NSString *const kFTVUserIdPredicateFormat = @"userID = %@";

@implementation FTVCoreUser (FTVExtension)

@dynamic picture;
@dynamic previewPicture;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    NSArray *extendingObjects = [self extendingObjects];
    for (id object in extendingObjects) {
        [self relinquishExtensionWithObject:object];
        [object release];
    }

    [super dealloc];
}

- (id)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context {
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self) {
        [self extendWithObject:[IDPModel object]];
        [self extendWithObject:[IDPModelMixin modelWithTarget:self]];
    }
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

+ (FTVCoreUser *)userWithId:(NSString *)userId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:kFTVUserIdPredicateFormat, userId];
    NSArray *reply = [FTVCoreUser fetchEntityWithSortDescriptors:nil
                                                       predicate:predicate
                                                   prefetchPaths:nil];
    FTVCoreUser *user = [reply lastObject];
    if (!user) {
        user = [FTVCoreUser managedObject];
        user.userID = userId;
        [user saveManagedObject];
    }
    
    return user;
}

#pragma mark -
#pragma mark Accessors

- (FTVImageModel *)previewPicture {
    id path = self.previewPicturePath;
    FTVImageModel *image = [FTVImageModel imageModelWithPath:path];
    NSLog(@"Preview request");
    
    return image;
}

- (FTVImageModel *)picture {
    id path = self.picturePath;
    FTVImageModel *image = [FTVImageModel imageModelWithPath:path];
    NSLog(@"Large image request");
    
    return image;
}

@end
