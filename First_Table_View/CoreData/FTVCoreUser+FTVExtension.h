//
//  FTVCoreUser+FTVExtension.h
//  First_Table_View
//
//  Created by Dren Drenov on 7/6/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVCoreUser.h"
#import "IDPActiveRecordKit.h"
#import "IDPModelProtocol.h"

@class FTVImageModel;

@interface FTVCoreUser (FTVExtension) <IDPModel>
@property (nonatomic, readonly)     FTVImageModel       *previewPicture;
@property (nonatomic, readonly)     FTVImageModel       *picture;

+ (FTVCoreUser *)userWithId:(NSString *)userId;

@end
