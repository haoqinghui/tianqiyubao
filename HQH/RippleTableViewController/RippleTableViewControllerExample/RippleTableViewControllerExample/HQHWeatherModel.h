//
//  HQHWeatherModel.h
//  rrfg
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQHWeatherModel : NSObject

//夜间风向，如白天风力风向与夜间风力风向一致，可合并为一行
@property(nonatomic,copy)NSString *fx2;
//白天风力
@property(nonatomic,copy)NSString *fl1;
//白天风向
@property(nonatomic,copy)NSString *fx1;
//夜间气温
@property(nonatomic,assign)NSInteger qw2;
//预报日期
@property(nonatomic,copy)NSString *date;
//夜间天气，当与白天天气相同时，两者可合并为一个
@property(nonatomic,copy)NSString *tq2;
//白天气温
@property(nonatomic,copy)NSString *qw1;
//夜间风力
@property(nonatomic,copy)NSString *fl2;
//白天天气
@property(nonatomic,copy)NSString *tq1;
//每小时气温
@property(nonatomic,copy)NSString *qw;





+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
