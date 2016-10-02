//
//  TableViewController.m
//  HW3UITableView
//
//  Created by Наталья on 27.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray *numbersArray;

@end

@implementation TableViewController


- (NSArray *)numbersArray
{
   if(!_numbersArray)
   {
       _numbersArray = @[@"0" ,@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
   }
    return _numbersArray;
}

#pragma mark View Cycle

- (void)viewDidLoad {
   [super viewDidLoad];
    
    
    
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions

- (IBAction)deleteRowsButtonDidClicked:(id)sender
{
    [self removeAllObjects];
    [self.tableView reloadData];
    
}

- (void)handleRefresh:(id)paramSender
{
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    if (self.numbersArray.count == 0)
    {
        _numbersArray = nil;
        [self numbersArray];
        [self.tableView reloadData];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.numbersArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row index : %ld", indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:16]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Section index : %ld", [indexPath section]];
    cell.backgroundColor = [self randomColors];

   return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
        return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView beginUpdates];
        [self removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }   
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    [self exchangeObjectsAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
    
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
        return YES;
}

#pragma mark utilites methods

- (void)removeAllObjects
{
    NSMutableArray *mutableArray = [_numbersArray mutableCopy];
    [mutableArray removeAllObjects];
    _numbersArray = [mutableArray copy];
    
}

- (void)exchangeObjectsAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex
{
    NSMutableArray *mutableArray = [_numbersArray mutableCopy];
    [mutableArray exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    _numbersArray = [mutableArray copy];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    NSMutableArray *mutableArray = [_numbersArray mutableCopy];
    [mutableArray removeObjectAtIndex:index];
    _numbersArray = [mutableArray copy];
}

- (UIColor*)randomColors
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
