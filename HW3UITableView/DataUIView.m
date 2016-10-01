//
//  DataUIView.m
//  HW3UITableView
//
//  Created by Ильяс Ихсанов on 29.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "DataUIView.h"

@implementation DataUIView

-(NSArray *) colorArray{
    return @[[UIColor redColor], [UIColor blueColor], [UIColor clearColor], [UIColor greenColor], [UIColor purpleColor], [UIColor yellowColor], [UIColor grayColor]];
}

-(NSMutableArray *) dataArray{
    NSMutableArray *myArray = [NSMutableArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", @"Five",@"One", @"Two", @"Three", @"Four", @"Five", nil];
    return myArray;
}

-(int) cellInSection1{
    return 3;
}
-(int) cellInSection2{
    return 4;
}
-(int) cellInSection3{
    return 5;
}
/*-(NSMutableArray *) dataArray{
    return [NSMutableArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", nil];
}*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
