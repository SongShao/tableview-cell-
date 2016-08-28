//
//  LSTCell.h
//  tableview
//
//  Created by lst on 16/8/26.
//  Copyright © 2016年 lst. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol myTableViewDelegate <NSObject>

-(void)myTablecellBtnClick:(UITableViewCell *)cell;

@end

@interface LSTCell : UITableViewCell
@property (nonatomic, strong) void(^myBlock)();
@property (nonatomic, assign) int currentIndex;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, strong) UIView *view;

@property (nonatomic, strong) UIButton *but;
@property (nonatomic, assign) id<myTableViewDelegate>delegate;
@end
