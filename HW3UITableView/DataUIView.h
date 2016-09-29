//
//  DataUIView.h
//  HW3UITableView
//
//  Created by Ленар on 27.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataUIView : UIView

-(NSMutableArray *) getArrayWithLabelText;
-(NSMutableArray *) getArrayWithDetailLabelText;
-(int)getFirstRowCount;
-(int)getSecondRowCount;
-(int)getThirdRowCount;
-(UIColor *)getRandomUIColor;

@end
