//
//  FTVVIewHandler.h
//  First_Table_View
//
//  Created by Dren Drenov on 6/26/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDPModelProtocol.h"

@protocol FTVViewHandlerProtocol <NSObject>

@required
@property (nonatomic, readonly)         id<IDPModel>       model;

- (void)willUpdate;
- (void)fillWithModel:(id<IDPModel>)model;
- (void)update;

@end

@interface FTVViewHandler : NSObject
@property (nonatomic, retain)   id<FTVViewHandlerProtocol>      view;
@property (nonatomic, retain)   id<IDPModel>                    model;

- (void)fillView:(id<FTVViewHandlerProtocol>)view
       withModel:(id<IDPModel>)model;

@end
