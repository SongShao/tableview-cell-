//
//  LSTCell.m
//  tableview
//
//  Created by lst on 16/8/26.
//  Copyright © 2016年 lst. All rights reserved.
//

#import "LSTCell.h"
#import "Masonry.h"
@implementation LSTCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        if (self) {
            self.currentIndex = -1;
            self.isOpen = NO;
            
        }
        
        
    }
    return self;
}
-(void)setupUI{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:view];
    self.view = view;
    
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
//    view.image = [UIImage imageNamed:@"psb"];
    UIButton *but = [[UIButton alloc]init];
    [but setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:but];
    self.but = but;
    [self.but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self settinglayout];
}

-(void)settinglayout{
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);

    }];
    
    [self.but mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-200);
        make.bottom.equalTo(self.view).offset(-20);
    }];
}
-(void)click{
    [self.delegate myTablecellBtnClick:self];
    
    if (_myBlock) {
        self.myBlock();
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
