//
//  MyTableViewController.m
//  HW3UITableView
//
//  Created by Ленар on 27.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "MyTableViewController.h"
#import "DataUIView.h"

@interface MyTableViewController ()

@property (strong, nonatomic) NSMutableArray *arrayWithLabelText;
@property (strong, nonatomic) NSMutableArray *arrayWithDetailLabelText;
@property (strong, nonatomic) DataUIView *data;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[DataUIView alloc]init];
    self.arrayWithLabelText = [NSMutableArray arrayWithArray:[self.data getArrayWithLabelText]];
    self.arrayWithDetailLabelText = [NSMutableArray arrayWithArray:[self.data getArrayWithDetailLabelText]];
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayWithLabelText.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [self.data getRandomUIColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@%i",[self.arrayWithLabelText objectAtIndex:indexPath.row], (int)indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%i",[self.arrayWithDetailLabelText objectAtIndex:indexPath.row], (int)indexPath.section];
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView beginUpdates];
        [self.arrayWithLabelText removeObjectAtIndex:indexPath.row];
        [self.arrayWithDetailLabelText removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

- (void)refreshTable {
    [self.refreshControl endRefreshing];
    if(self.arrayWithLabelText.count==0){
        self.arrayWithLabelText = [NSMutableArray arrayWithArray:[self.data getArrayWithLabelText]];
        self.arrayWithDetailLabelText = [NSMutableArray arrayWithArray:[self.data getArrayWithDetailLabelText]];
    }
    [self.tableView reloadData];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (IBAction)trashButton:(id)sender {
    [self.arrayWithLabelText removeAllObjects];
    [self.arrayWithDetailLabelText removeAllObjects];
    [self.tableView reloadData];
}

@end
