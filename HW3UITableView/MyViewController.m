//
//  MyViewController.m
//  HW3UITableView
//
//  Created by Ленар on 28.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "MyViewController.h"
#import "DataUIView.h"

@interface MyViewController ()

@property int firstSectionCountRow;
@property int secondSectionCountRow;
@property int thirdSectionCountRow;
@property (strong, nonatomic) DataUIView *data;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[DataUIView alloc]init];
    self.firstSectionCountRow = [self.data getFirstRowCount];
    self.secondSectionCountRow = [self.data getSecondRowCount];
    self.thirdSectionCountRow = [self.data getThirdRowCount];
}
#pragma mark - UISwitch for UITableView

- (IBAction)checkSectionSwitch:(id)sender {
    if(self.sectionSwitch.isOn){
        [self.rowSwitch setOn:NO animated:YES];
    }else{
        [self.rowSwitch setOn:YES animated:YES];
    }
    [self.tableView reloadData];
}
- (IBAction)checkRowSwitch:(id)sender {
    if(self.rowSwitch.isOn){
        [self.sectionSwitch setOn:NO animated:YES];
    }else {
        [self.sectionSwitch setOn:YES animated:YES];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return self.firstSectionCountRow;
    }
    if(section==1){
        return self.secondSectionCountRow;
    }
    if(section==2){
        return self.thirdSectionCountRow;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.rowSwitch.isOn){
        cell.textLabel.text = [NSString stringWithFormat:@"%i", (int)indexPath.row];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"%i", (int)indexPath.section];
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"SECTION NUMBER IS: %i",(int)section];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSUInteger count = [tableView.dataSource tableView:tableView numberOfRowsInSection:section];
    return [NSString stringWithFormat:@"Total objects count of section: %lu", (unsigned long)count];
}

- (IBAction) EditTable:(id)sender{
    if(self.editing)
    {
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
        if(indexPath.section ==0){
            self.firstSectionCountRow-=1;
        }
        if(indexPath.section ==1){
            self.secondSectionCountRow-=1;
        }
        if(indexPath.section ==2){
            self.thirdSectionCountRow-=1;
        }
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    if (fromIndexPath != toIndexPath ) {
        switch (fromIndexPath.section) {
            case 0:
                self.firstSectionCountRow-=1;
                break;
            case 1:
                self.secondSectionCountRow-=1;
                break;
            case 2:
                self.thirdSectionCountRow-=1;
            default:
                break;
        }
        switch (toIndexPath.section) {
            case 0:
                self.firstSectionCountRow+=1;
                break;
            case 1:
                self.secondSectionCountRow+=1;
                break;
            case 2:
                self.thirdSectionCountRow+=1;
                break;
            default:
                break;
        }
    }
}

- (IBAction)refreshTableButton:(id)sender {
    self.firstSectionCountRow = [self.data getFirstRowCount];
    self.secondSectionCountRow = [self.data getSecondRowCount];
    self.thirdSectionCountRow = [self.data getThirdRowCount];
    [self.tableView reloadData];
}

@end
