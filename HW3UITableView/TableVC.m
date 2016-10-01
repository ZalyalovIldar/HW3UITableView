//
//  TableVC.m
//  HW3UITableView
//
//  Created by Ильяс Ихсанов on 29.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "TableVC.h"
#import "DataUIView.h"


@interface TableVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISwitch *sectionIndexINCell;
@property (weak, nonatomic) IBOutlet UISwitch *rowsIndexInCell;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) NSMutableArray *nameArray;
@property (strong, nonatomic) DataUIView *data;
@property int section1;
@property int section2;
@property int section3;

@end

@implementation TableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [DataUIView new];
    // Do any additional setup after loading the view.
    _nameArray = [NSMutableArray arrayWithArray:_data.dataArray];
    _section1 = _data.cellInSection1;
    _section2 = _data.cellInSection2;
    _section3 = _data.cellInSection3;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

//ячейки
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _section1;
    }
    if (section == 1) {
        return _section2;
    }
    if (section == 2) {
        return _section3;
    }
    return 0;
}

//Заполнение ячеек данными - не отображение ячйки.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if (_sectionIndexINCell.isOn) {
        cell.textLabel.text = [NSString stringWithFormat:@"%li", (long)indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", (long)indexPath.section];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"%li", (long)indexPath.section];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", (long)indexPath.row];
    }
    
    return cell;
}



#pragma mark - methods



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Section number is %ld", section];
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Cell in section %ld", [tableView.dataSource tableView:tableView numberOfRowsInSection:section]];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        if (indexPath.section == 0) {
            _section1 -=1;
        }
        if (indexPath.section == 1) {
            _section2 -=1;
        }
        if (indexPath.section == 2){
            _section3 -=1;
        }
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    if (fromIndexPath != toIndexPath) {
        switch (fromIndexPath.section) {
            case 0:
                _section1 -=1;
                break;
            
            case 1:
                _section2 -=1;
                break;
                
            case 2:
                _section3 -=1;
            default:
                break;
        }
        switch (toIndexPath.section) {
            case 0:
                _section1 +=1;
                break;
            case 1:
                _section2 +=1;
                break;
            case 2:
                _section3 +=1;
                break;
                
            default:
                break;
        }
    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}





#pragma mark - Button

- (IBAction)refreshButton:(id)sender {
    _section1 = _data.cellInSection1;
    _section2 = _data.cellInSection2;
    _section3 = _data.cellInSection3;
    [self.tableView reloadData];
}

- (IBAction)editButton:(id)sender {
    if(self.editing){
        [super setEditing:NO animated:NO];
        [self.tableView setEditing:NO animated:NO];
        [self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
        
    }
    else
    {
        [super setEditing:YES animated:YES];
        [self.tableView setEditing:YES animated:YES];
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    
    }
}
#pragma mark - Switch

- (IBAction)showSectionInCell:(id)sender {
    if (_sectionIndexINCell.isOn) {
        [_rowsIndexInCell setOn:NO animated:YES];
        
    }else{
        [_rowsIndexInCell setOn:YES animated:YES];
    }
    [self.tableView reloadData];
}

- (IBAction)showRowsInCell:(id)sender {
    if (_rowsIndexInCell.isOn) {
        [_sectionIndexINCell setOn:NO animated:YES];
        
    }else{
        [_sectionIndexINCell setOn:YES animated:YES];
    }
    [self.tableView reloadData];
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
