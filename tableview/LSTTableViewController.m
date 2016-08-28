//
//  LSTTableViewController.m
//  tableview
//
//  Created by lst on 16/8/26.
//  Copyright © 2016年 lst. All rights reserved.
//  多行显示使用数组进行一点击过 cell 的保存  再次点击移除

#import "LSTTableViewController.h"
#import "LSTCell.h"
@interface LSTTableViewController ()<UITableViewDataSource,UITableViewDelegate>
//@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) NSMutableArray *muarr;
@end

@implementation LSTTableViewController
//static BOOL isOpen;
//用来保存已被选中的 cell 的索引
static int selectedIndex;
-(NSMutableArray *)muarr{
    if (!_muarr) {
        _muarr = [[NSMutableArray alloc]init];
    }
    return _muarr;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    //    self.tableView.estimatedRowHeight = 800;
    //    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.backgroundColor = [UIColor greenColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    isOpen = NO;
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

    
//    if (indexPath.row == selectedIndex && selectedIndex >= 0 ) {
//       isOpen = !isOpen;
//    }else{
//       isOpen = NO;
//    }
    
    selectedIndex = (int)indexPath.row;
    
//    [tableView reloadData];
    [tableView beginUpdates];
    [tableView endUpdates];
    NSLog(@"didSelectRowAtIndexPath");
    
    if (![self.muarr containsObject:indexPath] && self.muarr != nil) {
        [self.muarr addObject:indexPath];
//        isOpen = YES;
        
        
    }else if([self.muarr containsObject:indexPath]){
        [self.muarr removeObject:indexPath];
//        isOpen = NO;
    }
    NSLog(@"%@",self.muarr);
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  //判断当前索引是否是 被选中索引
 
    if ([self.muarr containsObject:indexPath]) {
        return 150;
    }else{
        return 100;
    }
    
//    if (selectedIndex == indexPath.row) {
//        
//        //判断当前 cell 是否被打开
//        if (!isOpen) {
//            return 150;
//        }
//        return 100;
//   
//    }else{
//        return 100;
//    }
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
