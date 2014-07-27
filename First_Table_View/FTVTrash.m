//
//  FTVTrash.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/25/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//

#import "FTVTrash.h"

@implementation FTVTrash

- (void)trash {
	NSHomeDirectory();
}

//- (void) writeToPlist: (NSString*)fileName withData:(NSMutableArray *)data
//{
//	NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//	NSString *finalPath = [documentsDirectory stringByAppendingPathComponent:fileName];
//	
//	[data writeToFile:finalPath atomically: YES];
//	/* This would change the firmware version in the plist to 1.1.1 by initing the NSDictionary with the plist, then changing the value of the string in the key "ProductVersion" to what you specified */
//}
//
//- (NSMutableArray *) readFromPlist: (NSString *)fileName {
//	NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//	NSString *finalPath = [documentsDirectory stringByAppendingPathComponent:fileName];
//	
//	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:finalPath];
//	
//	if (fileExists) {
//		NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:finalPath];
//		return arr;
//	} else {
//		return nil;
//	}
//}
////allert
//<UIAlertViewDelegate>
//UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Found Saved data!"
//													message:@"Load it"
//												   delegate:self
//										  cancelButtonTitle:@"Yes"
//										  otherButtonTitles:@"No", nil];
//
//[alertView show];
//[alertView release];
//
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//	if(buttonIndex == 0) {//Yes button pressed
//		
//		
//	}
//	else
//		
//		if(buttonIndex == 1) {//No button pressed.
//			
//		}
//}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)		tableView:(UITableView *)tableView
didEndDisplayingCell:(UITableViewCell *)cell
  forRowAtIndexPath:(NSIndexPath *)indexPath
{
//	FTVCell *temp = (FTVCell *)cell;
//	temp.object = nil;
//	NSLog(@"Hidding cell");
}

//check permissions
//
//[FBRequestConnection startWithGraphPath:@"/me/permissions"
//                      completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//
//                          NSArray *resultArray = [result data];
//                          for (id permission in resultArray) {
//                              NSLog(@"SDSSSD %@", [permission description]);
//                          };
//                      }];

//make photo
//NSData *pictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:pictureUrl]];
//UIImage *image = [UIImage imageWithData:pictureData];
//if (image != nil)
//friendImage = image;
//
//- (void)runInBackground:(void (^)(void))block completionHandler:(void (^)(void))completion {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        if (nil != block) {
//            block();
//            dispatch_async(dispatch_get_main_queue(), ^{
//                if (nil != completion) {
//                    completion();
//                }
//            });
//        }
//    });
//}

@end
