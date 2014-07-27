//
//  FTVModelImage.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 5/15/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "IDPModel.h"

@interface FTVImageModel : IDPModel <IDPModelObserver>
@property (nonatomic, readonly)     NSURL           *url;
@property (nonatomic, readonly)     UIImage         *image;

+ (id)imageModelWithUrl:(NSURL *)url;
+ (id)imageModelWithPath:(NSString *)path;

- (id)initWithUrl:(NSURL *)url;
- (id)initWithPath:(NSString *)path;

- (void)cancel;

@end
