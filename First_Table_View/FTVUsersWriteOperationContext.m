//
//  FTVUsersWriteOperationContext.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/20/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVUsersWriteOperationContext.h"
#import "FTVUsersModel.h"
#import "NSFileManager+FTVExtensions.h"

static NSString	*const kFTVStorageFileName	= @"users.plist";

@interface FTVUsersWriteOperationContext ()
@property (nonatomic, retain)       FTVUsersModel       *usersModel;
@property (nonatomic, readonly)     NSString            *path;

@end

@implementation FTVUsersWriteOperationContext

@dynamic path;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithUsers:(FTVUsersModel *)users {
    if (nil == users) {
        return nil;
    }
    
    return [[[self alloc] initWithObject:users] autorelease];
}

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.usersModel = nil;
    NSLog(@"Context %@ deallocated", [self class]);
    
    [super dealloc];
}

- (instancetype)initWithUsers:(FTVUsersModel *)users{
    self = [self init];
    if (self) {
        self.usersModel = users;
    }
    
    return self;
}



#pragma mark -
#pragma mark Accessors

- (NSString *)path {
	NSString *path = [NSFileManager homeDirectoryPathWithPathComponent:kFTVStorageFileName];
    
	return path;
}

#pragma mark -
#pragma mark Public Methods

// Works on main thread for appDelegate applicationWillTerminate capability

- (void)execute {
    NSArray *users = self.usersModel.users;
    if (![NSKeyedArchiver archiveRootObject:users toFile:self.path]) {
        NSLog(@"Error. Data not saved.");
        [self failLoading];
        
        return;
    }
    
    NSLog(@"Data saved");
    [self finishLoading];
}

@end
