//
//  HQHWeatherModel.m
//  rrfg
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HQHWeatherModel.h"


@implementation HQHWeatherModel

+(instancetype)modelWithDict:(NSDictionary *)dict{
    HQHWeatherModel *model=[[HQHWeatherModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}



@end
