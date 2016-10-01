//
//  FirstScenVC.m
//  HW3UITableView
//
//  Created by Ильяс Ихсанов on 28.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "FirstScenVC.h"
#import "DataUIView.h"

@interface FirstScenVC ()
@property (strong, nonatomic) DataUIView *data;
@property (strong, nonatomic) NSMutableArray *nameArray;

@end

@implementation FirstScenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _data = [DataUIView new];
    self.nameArray = [NSMutableArray arrayWithArray:_data.dataArray];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIRefreshControl * refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.attributedTitle   = [NSAttributedString.alloc initWithString:@"Refreshing..."];
    [refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.nameArray = [NSMutableArray arrayWithArray:_data.dataArray];
    
   
    
    NSLog(@"%@ %i", _nameArray, (int)_nameArray.count);
}

//Refresh Data
- (void)reloadData
{

    [self.refreshControl endRefreshing];
    
    if (_nameArray.count == 0) {
        _nameArray = [NSMutableArray arrayWithArray:_data.dataArray];
    }
    [self.tableView reloadData];
}

//удаление всех ячеек и данных
- (IBAction)trashButton:(id)sender {
    [_nameArray removeAllObjects];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//секции
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
//ячейки
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _nameArray.count;
}

//Заполнение ячеек данными - не отображение ячйки.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row index: %@", [self.nameArray objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Section index: %ld", (long)tableView.numberOfSections];
    cell.backgroundColor = [_data.colorArray objectAtIndex:arc4random()%_data.colorArray.count];
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


//удаление или добавление ячеек, используется вместе с Edit Button, который нужно раскомитить в viewDidLoad и добавить Navigation Controller на storyboard
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_nameArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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
