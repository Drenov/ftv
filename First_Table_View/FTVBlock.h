//
//  FTVBlock.h
//  First_Table_View
//
//  Created by Mykhailov Andrii on 5/12/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void FTVPerformBlockInBackground(void(^block)(void));

extern void FTVPerformBlockOnMainQueue(void(^block)(void));