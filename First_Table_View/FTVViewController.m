//
//  FTVViewController.m
//  First_Table_View
//
//  Created by Dren Drenov on 6/26/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVViewController.h"
#import "IDPPropertyMacros.h"

@implementation FTVViewController

- (void)dealloc {
    self.object = nil;
    
    [super dealloc];
}

- (void)setObject:(id)object {
    IDPNonatomicRetainPropertySynthesizeWithObserver(_object, object);
}

@end
