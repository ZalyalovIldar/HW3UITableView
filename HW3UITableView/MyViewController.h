//
//  MyViewController.h
//  HW3UITableView
//
//  Created by Ленар on 28.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *sectionSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rowSwitch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
