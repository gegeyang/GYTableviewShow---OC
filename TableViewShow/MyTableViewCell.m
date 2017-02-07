//
//  MyTableViewCell.m
//  TableViewShow
//
//  Created by GeYang on 2017/1/4.
//  Copyright © 2017年 GeYang. All rights reserved.
//

#import "MyTableViewCell.h"
#import "Model.h"


@interface MyTableViewCell()
@property (nonatomic, strong) UILabel  *namelb;
@property (nonatomic, strong) UIView   *line;
@property (nonatomic, strong) UIView   *titleView;
@property (nonatomic, strong) UIButton *selectedBtn;
@property (nonatomic, strong) UILabel  *title;
@property (nonatomic, weak)   Model    *model;
@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    _namelb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 0, 20)];
    _namelb.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview: _namelb];
    
    _selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectedBtn setImage:[UIImage imageNamed:@"下标黑.png"] forState:UIControlStateNormal];
    _selectedBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 0, 70, 50);
    _selectedBtn.transform = CGAffineTransformRotate(_selectedBtn.transform, M_PI);
    [_selectedBtn addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview: _selectedBtn];
    
    _line = [[UIView alloc]initWithFrame:CGRectMake(0, _namelb.frame.origin.y + _namelb.frame.size.height + 5, 10, 2)];
    _line.backgroundColor = [UIColor redColor];
    [self.contentView addSubview: _line];
    
    _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, _line.frame.origin.y + _line.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width, 1)];
    _titleView.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.5];
    _titleView.clipsToBounds = YES;
    [self.contentView addSubview: _titleView];
    _title = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, _titleView.frame.size.width - 20, 0)];
    _title.numberOfLines = 0;
    _title.textColor = [UIColor whiteColor];
    _title.font = [UIFont fontWithName:@"GeezaPro" size:14];
    [_titleView addSubview: _title];
    
}

- (void)selected:(UIButton *)sender{
    if (_model.isShow) {
        //当前展开   成为关闭   刷新
        _model.isShow = NO;
        _model.height = 50;
        [_tabelview beginUpdates];
        [_tabelview endUpdates];
        [UIView animateWithDuration:0.5 animations:^{
            _namelb.frame = CGRectMake(10, 10, [self getTextWidth].width, 20);
            _line.frame = CGRectMake(0, _namelb.frame.origin.y + _namelb.frame.size.height + 5, 10, 2);
            _titleView.frame = CGRectMake(0, _line.frame.origin.y + _line.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width, 1);
            _selectedBtn.transform = CGAffineTransformRotate(_selectedBtn.transform, M_PI);
        }];
    }else{
        //当前关闭   成为展开   刷新
        _model.isShow = YES;
        _model.height = _titleView.frame.origin.y + _title.frame.origin.y + 5 + [self getTextHeigt].height;
        [_tabelview beginUpdates];
        [_tabelview endUpdates];
        [UIView animateWithDuration:0.5 animations:^{
            _namelb.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - [self getTextWidth].width / 2, 10, [self getTextWidth].width, 20);
            _line.frame = CGRectMake(0, _namelb.frame.origin.y + _namelb.frame.size.height + 5, [UIScreen mainScreen].bounds.size.width, 2);
            _title.frame = CGRectMake(10, 5, _titleView.frame.size.width - 20, [self getTextHeigt].height);
            _titleView.frame = CGRectMake(0, _line.frame.origin.y + _line.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width, _title.frame.origin.y + _title.frame.size.height + 5);
            _selectedBtn.transform = CGAffineTransformIdentity;
        }];
    }
}

- (void)loadData:(id)data{
    _model = data;
    _namelb.text = _model.name;
    _title.text = _model.titleView;
    if (_model.isShow) {
        _namelb.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - [self getTextWidth].width / 2, 10, [self getTextWidth].width, 20);
        _line.frame = CGRectMake(0, _namelb.frame.origin.y + _namelb.frame.size.height + 5, [UIScreen mainScreen].bounds.size.width, 2);
        _title.frame = CGRectMake(10, 5, _titleView.frame.size.width - 20, [self getTextHeigt].height);
        _titleView.frame = CGRectMake(0, _line.frame.origin.y + _line.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width, _title.frame.origin.y + _title.frame.size.height + 5);
    }else{
        _namelb.frame = CGRectMake(10, 10, [self getTextWidth].width, 20);
        _line.frame = CGRectMake(0, _namelb.frame.origin.y + _namelb.frame.size.height + 5, 10, 2);
        _titleView.frame = CGRectMake(0, _line.frame.origin.y + _line.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width, 1);
    }
}

//获取title的高度
- (CGSize)getTextHeigt{
    CGSize size = [_title sizeThatFits:CGSizeMake(_title.frame.size.width, MAXFLOAT)];
    return size;
}

//获取名称的宽度
- (CGSize)getTextWidth{
    CGSize size = [_namelb sizeThatFits:CGSizeMake(MAXFLOAT, _namelb.frame.size.height)];
    return size;
}















@end
