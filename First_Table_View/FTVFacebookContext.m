//
//  FTVFacebookContext.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/23/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVFacebookContext.h"
#import "FTVBlock.h"
#import "IDPPropertyMacros.h"

static	NSString *const	kFTVGraphObjectPathForPicture = @"picture";
static	NSString *const	kFTVGraphObjectPathForData = @"data";
static	NSString *const	kFTVGraphObjectPathForUrl = @"url";

NSString* graphObjectPictureUrl (FBGraphObject<FBGraphUser> *graphUser) {
    NSString *url = graphUser   [kFTVGraphObjectPathForPicture]
                                [kFTVGraphObjectPathForData]
                                [kFTVGraphObjectPathForUrl];
    return url;
}

@interface FTVFacebookContext ()
@property (nonatomic, retain)       FBRequestConnection     *request;

@end

@implementation FTVFacebookContext

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self cancel];
    
    [super dealloc];
}

#pragma mark-
#pragma mark Accessors

- (void)setRequest:(FBRequestConnection *)request {
    if (request != _request) {
        [_request cancel];
    }
    
    IDPNonatomicRetainPropertySynthesize(_request, request);
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    [self performRequest];
}

- (void)cancel {
    self.request = nil;
    [super cancel];
}

#pragma mark -
#pragma mark Private Methods

- (void)performRequest {
    void (^FBRequestHandler)(FBRequestConnection *connection,id result,NSError *error);
    
    FBRequestHandler = ^(FBRequestConnection *connection,id result,NSError *error) {
        if (!error) {
            NSLog(@"Transfering detail facebook response to user");
            [self fillObjectWithFacebookData:result];
            FTVPerformBlockOnMainQueue(^{
                [self finishLoading];
            });
        } else {
            NSLog(@"Facebook connection failed");
            [self handleError:error];
        }
    };

    self.request = [FBRequestConnection startWithGraphPath:[self graphPath]
                                         completionHandler:FBRequestHandler];
}

- (void)handleError:(NSError *)error {
    FBErrorCode errorCode = error.code;
    
    if (FBErrorOperationCancelled == errorCode) {
        NSLog(@"%@ request cancelled.", [self class]);
        [self cancel];
        
        return;
    }
    
    NSLog(@"%@ request error  - %@", [self class], error);
    [self failLoading];
}

#pragma mark -
#pragma mark FTVFacebookContextProtocol

- (void)fillObjectWithFacebookData:(FBGraphObject<FBGraphUser> *)data {
    NSLog(@"Override super fillObjectWithFacebookData required");
}

- (NSString * )graphPath {
    NSLog(@"Override super graphPath required");
    
    return nil;
}

@end
