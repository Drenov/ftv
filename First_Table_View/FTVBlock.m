//
//  FTVBlock.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 5/12/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVBlock.h"

void FTVPerformBlockInBackground(void(^block)(void)) {
	if (nil == block) {
		return;
    }
    
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block);
}

void FTVPerformBlockOnMainQueue(void(^block)(void)) {
	if (nil == block) {
		return;
    }
    
	dispatch_async(dispatch_get_main_queue(), block);
}