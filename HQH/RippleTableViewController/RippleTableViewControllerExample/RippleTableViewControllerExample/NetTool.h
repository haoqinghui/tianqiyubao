//
//  NetTool.h
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HQHWeatherModel.h"


@interface NetTool : NSObject
@property(nonatomic,strong)HQHWeatherModel *model;
@property(nonatomic,copy)NSMutableArray *modelArray;
@property(nonatomic,copy)NSDictionary *successDict;



+ (instancetype)sharedToolManager;

//-(void)getWithUrl:(NSString *)url andSuccess:(void (^)(NSMutableArray * modelArray))success;

- (void)getWithUrl:(NSString *)URLString
                               success:(nullable void (^)(NSDictionary *successDict))successDict
                               failure:(nullable void (^)( NSError *error))failure;


@end
