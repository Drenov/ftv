//
//  FTVViewController.m
//  First_Table_View
//
//  Created by Mykhailov Andrii on 4/16/14.
//  Copyright (c) 2014 Mykhailov Andrii. All rights reserved.
//
#import "FTVFriendsViewController.h"
#import "FTVFriendDetailViewController.h"

#import "FTVFriendsView.h"
#import "FTVCell.h"
#import "FTVImageView.h"
#import "FTVUserModels.h"

#import "UITableView+IDPCellLoading.h"
#import "UIViewController+IDPExtensions.h"

#import "NSMutableArray+FTVExtensions.h"

@interface FTVFriendsViewController ()
@property (nonatomic, readonly)         FTVFriendsView          *friendsView;
@property (nonatomic, retain)           FTVUserModels           *userModels;

@end

@implementation FTVFriendsViewController

@dynamic friendsView;

#pragma mark -
#pragma mark Accessors

IDPViewControllerViewOfClassGetterSynthesize(FTVFriendsView, friendsView);

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UI Handling Methods

- (IBAction)onEdit:(id)sender {
	NSLog(@"Edit Button Pressed");
	UITableView *tableView = self.tableView;
    
	[tableView setEditing:!tableView.isEditing animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)		tableView:(UITableView *)tableView
		numberOfRowsInSection:(NSInteger)section
{
	return [self.object count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSUInteger index = indexPath.row;
	NSLog(@"Loaded cell for row - %d", index);
	
	id user = [self.object objectAtIndex:index];
	
	FTVCell *cell = [tableView dequeueCell:[FTVCell class]];
    [cell fillWithModel:user];
	
	return cell;
}

//Rows managing
- (void)    	tableView:(UITableView *)tableView
       moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
			  toIndexPath:(NSIndexPath *)toIndexPath
{
    NSInteger fromIndex = fromIndexPath.row;
    NSInteger toIndex = toIndexPath.row;
	NSLog(@"Move row from %d to %d",  fromIndex, toIndex);
	if (fromIndex == toIndex) {
		return;
	}
	
	[self.object moveObjectAtIndex:fromIndex toIndex:toIndex];
}

- (void)	tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
	forRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@" Delete button pressed. IndexPath:%@",indexPath);
	if (nil == indexPath) {
		return;
	}
	
	if (UITableViewCellEditingStyleDelete == editingStyle) {
		[self.object removeObjectAtIndex:indexPath.row];
        NSArray *rowInArray = [NSArray arrayWithObject:indexPath];
		[self.tableView deleteRowsAtIndexPaths:rowInArray
							  withRowAnimation:UITableViewRowAnimationAutomatic];
	}
}

#pragma mark -
#pragma mark UITableViewDelegate Protocol

- (void)            tableView:(UITableView *)tableView
      didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    NSLog(@"Selected row %d", index);
    FTVFriendDetailViewController *controller = nil;
    controller = [FTVFriendDetailViewController defaultNibController];
    controller.object = [self.object objectAtIndex:index];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
