//
//  HQHWeatherHourModel.h
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/24.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQHWeatherHourModel : NSObject
//每小时气温
@property(nonatomic,copy)NSString *qw;
//每小时
@property(nonatomic,copy)NSString *sj;
//每小时天气
@property(nonatomic,copy)NSString *tq;

+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
