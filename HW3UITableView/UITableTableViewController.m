//
//  UITableTableViewController.m
//  HW3UITableView
//
//  Created by Rustam N on 28.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "UITableTableViewController.h"

@interface UITableTableViewController ()

@property (strong, nonatomic) NSMutableArray *colorArr;

@end

@implementation UITableTableViewController

#pragma mark - View controllers
- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorArr = [NSMutableArray arrayWithObjects: [UIColor redColor], [UIColor grayColor], [UIColor greenColor], [UIColor yellowColor],[UIColor orangeColor], [UIColor purpleColor], [UIColor lightGrayColor], [UIColor blueColor], [UIColor brownColor], nil];
    
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"Colors Table";
    [self.refreshControl addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    self.clearsSelectionOnViewWillAppear = YES;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _colorArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath:indexPath];
    cell.backgroundColor = _colorArr[arc4random()%_colorArr.count];
    cell.textLabel.text = [NSString stringWithFormat:@"Row index: %ld", (long)indexPath.row];
    cell.detailTextLabel.text =  [NSString stringWithFormat:@"Section index: %ld", (long)indexPath.section];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_colorArr removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


#pragma mark - Others
- (void)refreshView:(UIRefreshControl *)sender {
    [self.tableView reloadData];
    [sender endRefreshing];
}

- (IBAction)clearAll:(id)sender {
    self.colorArr = nil;
    [self.tableView reloadData];
}

@end
