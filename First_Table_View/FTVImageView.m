//
//  FTVImage.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/30/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVImageView.h"
#import "FTVImageModel.h"
#import "IDPPropertyMacros.h"

@interface FTVImageView ()
@property (nonatomic, retain)       FTVImageModel       *imageModel;

@end

@implementation FTVImageView

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.imageView = nil;
	self.activityIndicatorView = nil;
    self.imageModel = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(FTVImageModel *)imageModel {
    if (imageModel != _imageModel) {
        [_imageModel cancel];
    }

    IDPNonatomicRetainPropertySynthesizeWithObserver(_imageModel, imageModel);
    [_imageModel load];
}

#pragma mark-
#pragma mark Public Methods

- (void)fillWithModel:(FTVImageModel *)model {
    [self.activityIndicatorView startAnimating];
    self.imageView.image = nil;
    self.imageModel = model;
}

#pragma mark-
#pragma mark IDPModelObserver

- (void)modelDidLoad:(FTVImageModel *)theModel {
    if (theModel == self.imageModel) {
        id image = theModel.image;
        self.imageView.image = image;
        [self.activityIndicatorView stopAnimating];
        NSLog(@"Image %@ did load, updating view", image);
    }
}

- (void)modelDidFailToLoad:(FTVImageModel *)theModel {
    if (theModel == self.imageModel) {
        self.pictureView.image = theModel.image;
        [self.activityIndicatorView stopAnimating];
        NSLog(@"Object %@ failed to load image", theModel);
    }
}
- (void)modelDidCancelLoading:(id)theModel {
    if (theModel == self.imageModel) {
        [self.activityIndicatorView stopAnimating];
    }
}

@end
