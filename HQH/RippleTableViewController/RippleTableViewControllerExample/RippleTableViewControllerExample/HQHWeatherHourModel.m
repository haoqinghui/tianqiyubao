//
//  HQHWeatherHourModel.m
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/24.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import "HQHWeatherHourModel.h"

@implementation HQHWeatherHourModel
+(instancetype)modelWithDict:(NSDictionary *)dict{
    HQHWeatherHourModel *model=[[HQHWeatherHourModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
