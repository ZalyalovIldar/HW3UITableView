//
//  ViewController.m
//  HW3UITableView
//
//  Created by Ildar Zalyalov on 27.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISwitch *sectionSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rowsSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rowsLabel;


@property (strong, nonatomic) NSArray *sections;


@end

@implementation ViewController

- (NSArray *)sections
{
    if (!_sections)
    {
        _sections = @[@[@"0", @"1", @"2", @"3"], @[@"0", @"1", @"2", @"3", @"4"], @[@"0",@"1",@"2"]];
    }
    return _sections;
}

#pragma mark view cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.sectionSwitch setOn:NO animated:YES];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.sectionLabel.text = @"Show section index in cells";
    [self.sectionLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_sectionLabel sizeToFit];
    self.rowsLabel.text = @"Show rows index in cell";
    [self.rowsLabel setFont:[UIFont boldSystemFontOfSize:16]];

    [self.rowsLabel sizeToFit];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    [self.tableView setEditing:editing animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Actions
- (IBAction)refreshButtonDidClicked:(id)sender
{
    self.sections = nil;
    [self.tableView reloadData];
}


- (IBAction)checkSectionSwitch:(id)sender
{
    [self.rowsSwitch setOn:!self.sectionSwitch.isOn animated:YES];
    [self.tableView reloadData];
}

- (IBAction)checkRowSwitch:(id)sender {
    
    [self.sectionSwitch setOn:!self.rowsSwitch.isOn animated:YES];
    [self.tableView reloadData];
}


#pragma mark Data Source
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sections[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if (self.rowsSwitch.isOn)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
        [cell.textLabel setFont:[UIFont boldSystemFontOfSize:16]];

    } else
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
        [cell.textLabel setFont:[UIFont boldSystemFontOfSize:16]];

    }
    
    return cell;
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSArray *rows = self.sections[indexPath.section];
        NSMutableArray *mutableRows = [rows mutableCopy];
        [mutableRows removeObjectAtIndex:indexPath.row];
        NSMutableArray *mutableSections = [self.sections mutableCopy];
        mutableSections[indexPath.section] = [mutableRows copy];
        self.sections = [mutableSections copy];
        [tableView beginUpdates];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
       
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    if (fromIndexPath.section == toIndexPath.section)
    {
        return;
    }
    
    NSArray *fromRows = self.sections[fromIndexPath.section];
    NSArray *toRows = self.sections[toIndexPath.section];
    
    
    
    NSMutableArray *mutableFromRows = [fromRows mutableCopy];
    NSMutableArray *mutableToRows = [toRows mutableCopy];
    
    
    id temp = mutableFromRows[fromIndexPath.row];
    [mutableFromRows removeObjectAtIndex:fromIndexPath.row];
    [mutableToRows insertObject:temp atIndex:toIndexPath.row];
    
    NSMutableArray *mutableSections = [self.sections mutableCopy];
    
    mutableSections[fromIndexPath.section] = [mutableFromRows copy];
    mutableSections[toIndexPath.section] = [mutableToRows copy];
    
    self.sections = [mutableSections copy];
    
}

#pragma mark Table View Delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle;
    sectionTitle = [NSString stringWithFormat:@"SECTION NUMBER IS : %ld", section];
    return sectionTitle;
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *sectionFooter;
    sectionFooter = [NSString stringWithFormat:@"Total object count in section :  %ld",[self.sections[section] count]];
    return sectionFooter;
}
@end
