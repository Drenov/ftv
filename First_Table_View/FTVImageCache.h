//
//  FTVImageCache.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/12/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "IDPSingletonModel.h"
#import "FTVImageModel.h"

@interface FTVImageCache : IDPSingletonModel

- (void)addImageModel:(FTVImageModel *)imageModel forUrl:(NSURL *)url;
- (void)removeImageModelForUrl:(NSURL *)url;

- (FTVImageModel *)imageModelForUrl:(NSURL *)url;

@end
