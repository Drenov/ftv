//
//  FTVHandlingObject.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/29/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVUser.h"

static	NSString *const	kFTVCodingKeyForFirstName = @"firstName";
static	NSString *const	kFTVCodingKeyForLastName = @"lastName";
static	NSString *const	kFTVCodingKeyForUserID = @"userID";
static	NSString *const	kFTVCodingKeyForCity = @"city";
static	NSString *const	kFTVCodingKeyForCountry = @"country";
static	NSString *const	kFTVCodingKeyForPreviewPicture = @"previewPicture";
static	NSString *const	kFTVCodingKeyForLargePicture = @"largePicture";

@implementation FTVUser

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.firstName = nil;
    self.lastName = nil;
    self.userID = nil;
	self.previewPicture = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.firstName = [decoder decodeObjectForKey:kFTVCodingKeyForFirstName];
        self.lastName = [decoder decodeObjectForKey:kFTVCodingKeyForLastName];
        self.userID = [decoder decodeObjectForKey:kFTVCodingKeyForUserID];
        self.city = [decoder decodeObjectForKey:kFTVCodingKeyForCity];
        self.country = [decoder decodeObjectForKey:kFTVCodingKeyForCountry];
        self.previewPicture = [decoder decodeObjectForKey:kFTVCodingKeyForPreviewPicture];
		self.largePicture = [decoder decodeObjectForKey:kFTVCodingKeyForLargePicture];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	NSLog(@"Object encoded");
    [coder encodeObject:self.firstName forKey:kFTVCodingKeyForFirstName];
    [coder encodeObject:self.lastName forKey:kFTVCodingKeyForLastName];
    [coder encodeObject:self.userID forKey:kFTVCodingKeyForUserID];
    [coder encodeObject:self.city forKey:kFTVCodingKeyForCity];
    [coder encodeObject:self.country forKey:kFTVCodingKeyForCountry];
    [coder encodeObject:self.previewPicture forKey:kFTVCodingKeyForPreviewPicture];
    [coder encodeObject:self.largePicture forKey:kFTVCodingKeyForLargePicture];
}

#pragma mark-
#pragma mark IDPModel

- (void)cleanup {
	NSLog(@"Object %@ cleanup (Model)", self.firstName);
	[self.previewPicture dump];
    [self.largePicture dump];
}

@end
