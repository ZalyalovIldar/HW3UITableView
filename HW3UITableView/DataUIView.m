//
//  DataUIView.m
//  HW3UITableView
//
//  Created by Ленар on 27.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "DataUIView.h"

@implementation DataUIView

-(NSMutableArray *)getArrayWithLabel{
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", nil];
    return arr;
}

-(NSMutableArray *)getArrayWithDetailLabel{
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"Section index:",@"Section index:",@"Section index:",@"Section index:",@"Section index:",@"Section index:",@"Section index:",@"Section index:",@"Section index:", @"Section index:", nil];
    return arr;
}

-(int)getFirstRowCount{
    return 4;
}

-(int)getThirdRowCount{
    return 3;
}

-(int)getSecondRowCount{
    return 5;
}

@end
