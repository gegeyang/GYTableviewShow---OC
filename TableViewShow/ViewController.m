//
//  ViewController.m
//  TableViewShow
//
//  Created by GeYang on 2017/1/4.
//  Copyright © 2017年 GeYang. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "MyTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, strong) NSMutableArray *muarr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _muarr = [NSMutableArray array];
    
    
    
    
    
    
    _arr = @[@{@"name":@"名称", @"titleView":@"hahhahahahahh"},
             @{@"name":@"geyang1", @"titleView":@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈"},
             @{@"name":@"geyang哈哈哈哈哈哈哈", @"titleView":@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈"},
             @{@"name":@"G", @"titleView":@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈"},
             @{@"name":@"geyang4", @"titleView":@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈"},
             @{@"name":@"geyang5", @"titleView":@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈"},
             @{@"name":@"geyang6", @"titleView":@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈"},
             @{@"name":@"geyang7", @"titleView":@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈"}];
    
    for (int i = 0; i < _arr.count; i++) {
        [_muarr addObject: [Model ModelWithDictionary: _arr[i]]];
    }
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 23, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 23) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.tableFooterView = [[UIView alloc]init];
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview: _tableview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Model *model = _muarr[indexPath.row];
    return model.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tableview registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.tabelview = _tableview;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell loadData: _muarr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}























@end
