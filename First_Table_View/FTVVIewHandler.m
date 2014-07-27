//
//  FTVVIewHandler.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/26/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVViewHandler.h"

@implementation FTVViewHandler

- (void)dealloc {
    self.view = nil;
    self.model = nil;
    
    [super dealloc];
}


- (void)fillView:(id<FTVViewHandlerProtocol>)view
       withModel:(id<IDPModel>)model
{
    self.view = view;
    self.model = model;
    [view willUpdate];
    [view fillWithModel:model];
    [view update];
}

@end
