//
//  MyTableViewCell.h
//  TableViewShow
//
//  Created by GeYang on 2017/1/4.
//  Copyright © 2017年 GeYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (nonatomic, strong) UITableView *tabelview;
- (void)loadData:(id)data;
@end
