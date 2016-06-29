//
//  HQHInFoModel.m
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/26.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import "HQHInFoModel.h"

@implementation HQHInFoModel
+(instancetype)modelWithDict:(NSDictionary *)dict{
    HQHInFoModel *model=[[HQHInFoModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}@end
