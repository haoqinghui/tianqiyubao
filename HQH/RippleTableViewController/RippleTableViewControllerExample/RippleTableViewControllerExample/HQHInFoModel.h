//
//  HQHInFoModel.h
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/26.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQHInFoModel : NSObject
//详细描述
@property(nonatomic,copy)NSString *longDesc;
//简短描述
@property(nonatomic,copy)NSString *shortDesc;
//指数名称
@property(nonatomic,copy)NSString *type;

+(instancetype)modelWithDict:(NSDictionary *)dict;
@end
