//
//  Model.h
//  TableViewShow
//
//  Created by GeYang on 2017/1/4.
//  Copyright © 2017年 GeYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Model : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *titleView;
@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, assign) CGFloat height;
+ (instancetype)ModelWithDictionary:(NSDictionary *)dictionary;
@end
