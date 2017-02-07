//
//  Model.m
//  TableViewShow
//
//  Created by GeYang on 2017/1/4.
//  Copyright © 2017年 GeYang. All rights reserved.
//

#import "Model.h"

@implementation Model
+ (instancetype)ModelWithDictionary:(NSDictionary *)dictionary{
    Model *models = [[Model alloc]init];
    [models setValuesForKeysWithDictionary:dictionary];
    models.isShow = NO;
    models.height = 50;
    return models;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
