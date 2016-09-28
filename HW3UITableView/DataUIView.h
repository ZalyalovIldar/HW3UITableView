//
//  DataUIView.h
//  HW3UITableView
//
//  Created by Ленар on 27.09.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataUIView : UIView

-(NSMutableArray *) getArrayWithLabel;
-(NSMutableArray *) getArrayWithDetailLabel;
-(int)getFirstRowCount;
-(int)getSecondRowCount;
-(int)getThirdRowCount;

@end
