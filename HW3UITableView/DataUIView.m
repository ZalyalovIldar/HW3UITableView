//
//  DataUIView.m
//  HW3UITableView
//
//  Created by Ленар on 27.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "DataUIView.h"

@implementation DataUIView

-(NSMutableArray *)getArrayWithLabelText{
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", @"Row index:", nil];
    return arr;
}

-(NSMutableArray *)getArrayWithDetailLabelText{
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

-(UIColor *) getRandomUIColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

@end
