//
//  UIViewControllers.m
//  HW3UITableView
//
//  Created by Rustam N on 29.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "UIViewControllers.h"

@interface UIViewControllers () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISwitch *sectionShowSwitch;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) IBOutlet UISwitch *rowShowSwitch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) int firstSectionCount;
@property (nonatomic) int secondSectionCount;
@property (nonatomic) int thirdSectionCount;
@property (strong, nonatomic) NSMutableArray *colorArr;

@end

@implementation UIViewControllers

#pragma mark - View controllers
- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorArr = [NSMutableArray arrayWithObjects: [UIColor redColor], [UIColor grayColor], [UIColor greenColor], [UIColor yellowColor],[UIColor orangeColor], nil];
    _rowShowSwitch.onTintColor = [UIColor redColor];
    _rowShowSwitch.tintColor = [UIColor redColor];
    [_sectionShowSwitch setOn:false];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _firstSectionCount  = 4;
    _secondSectionCount = 3;
    _thirdSectionCount  = 3;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return _firstSectionCount;
            break;
        case 1:
            return _secondSectionCount;
            break;
        case 2:
            return _thirdSectionCount;
            break;
            
        default:
            return 0;
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath:indexPath];
    if(_sectionShowSwitch.isOn){
        cell.textLabel.text = [NSString stringWithFormat:@"Sections index: %ld", (long)indexPath.section];
    }
    else{
        cell.textLabel.text = [NSString stringWithFormat:@"Row index: %ld", (long)indexPath.row];
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"SECTION NUMBER IS: %i",(int)section];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [NSString stringWithFormat:@"Total object count of section %i",(int)_firstSectionCount];
            break;
        case 1:
            return [NSString stringWithFormat:@"Total object count of section %i",(int)_secondSectionCount];
            break;
        case 2:
            return [NSString stringWithFormat:@"Total object count of section %i",(int)_thirdSectionCount];
            break;
        default:
            return 0;
    }
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
         [tableView beginUpdates];
        switch (indexPath.section) {
            case 0:
                _firstSectionCount--;
                break;
            case 1:
                _secondSectionCount--;
                break;
            case 2:
                _thirdSectionCount--;
                break;
        }
        [_colorArr removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
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
- (IBAction)changeSwitch:(id)sender {
    if(_sectionShowSwitch.isOn && !_rowShowSwitch.isOn){
        [_sectionShowSwitch setOn:false];
        [_rowShowSwitch setOn:true];
    }
    else{
        [_sectionShowSwitch setOn:true];
        [_rowShowSwitch setOn:false];
    }
    [_tableView reloadData];
}
- (IBAction)refreshActions:(id)sender {
    [_tableView reloadData];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    if (editing) {
        [self.tableView setEditing:YES animated:YES];
        
    } else {
        [self.tableView setEditing:NO animated:NO];
        
    }
}


@end
