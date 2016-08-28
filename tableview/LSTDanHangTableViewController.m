//
//  LSTDanHangTableViewController.m
//  tableview
//
//  Created by lst on 16/8/28.
//  Copyright © 2016年 lst. All rights reserved.
//  单行显示使用 BOOL 属性判断 cell 是否被选中

#import "LSTDanHangTableViewController.h"
#import "LSTCell.h"

@interface LSTDanHangTableViewController ()<UITableViewDataSource,UITableViewDelegate>
//@property (nonatomic, assign) BOOL isSelected;
@end

@implementation LSTDanHangTableViewController
//使用布尔值保存已被点开 cell
static BOOL isOpen;
//保存当前已被选中的 cell 的索引
static int selectedIndex;

-(void)viewDidLoad{
    [super viewDidLoad];
    //    self.tableView.estimatedRowHeight = 800;
    //    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.backgroundColor = [UIColor greenColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    isOpen = NO;
    selectedIndex = -1;
    
    
    //    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"Identifier";
    //缓存池中取
    LSTCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //如果缓存池中没有就创建新的
    if(!cell){
        cell = [[LSTCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.myBlock = ^(){
        NSLog(@"%ld",(long)indexPath.row);
        UIViewController *con = [[UIViewController alloc]init];
        con.view.bounds = [UIScreen mainScreen].bounds;
        con.view.backgroundColor = [UIColor grayColor];
        [self.navigationController pushViewController:con animated:YES];
        
    };
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.but.tag = 1000 + indexPath.row;
    //    [cell.but addTarget:self action:@selector(tiaoZhuang:) forControlEvents:UIControlEventTouchUpInside];
    
    //    cell.delegate = self;
    
    return cell;}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == selectedIndex && selectedIndex >= 0 ) {
        isOpen = !isOpen;
    }else{
        isOpen = NO;
    }
    
    selectedIndex = (int)indexPath.row;
    //    [tableView reloadData];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    [tableView beginUpdates];
    [tableView endUpdates];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //判断当前索引是否是 被选中索引
    if (selectedIndex == indexPath.row) {
        
        //判断当前 cell 是否被打开
        if (!isOpen) {
            return 150;
        }
        return 100;
        
    }else{
        return 100;
    }
}
//-(void)myTablecellBtnClick:(UITableViewCell *)cell{
//    NSIndexPath *index = [self.tableView indexPathForCell:cell];
//
//    NSLog(@"333===%ld",index.row);
//    UIViewController *con = [[UIViewController alloc]init];
//    con.view.bounds = [UIScreen mainScreen].bounds;
//    con.view.backgroundColor = [UIColor grayColor];
//    [self setModalPresentationStyle:UIModalPresentationFullScreen];
//    [self presentViewController:con animated:YES completion:nil];
//}

//
//-(void)tiaoZhuang:(LSTCell *)cella{
//
//    //    [self.navigationController pushViewController:photoPicker animated:YES];
//        NSLog(@"%ld",    cella.tag);
//    UIViewController *con = [[UIViewController alloc]init];
//    con.view.bounds = [UIScreen mainScreen].bounds;
//    con.view.backgroundColor = [UIColor grayColor];
//
//    UIButton *butt = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [butt setBackgroundColor:[UIColor redColor]];
//    [butt addTarget:self action:@selector(tiaochu) forControlEvents:UIControlEventTouchUpInside];
//    [con.view addSubview:butt];
//    [self.navigationController pushViewController:con animated:YES];
//
//
//}

//-(void)tiaochu{
//    NSLog(@"woyaotiaochu ");
//    [self.navigationController popViewControllerAnimated:YES ];
//}

@end
