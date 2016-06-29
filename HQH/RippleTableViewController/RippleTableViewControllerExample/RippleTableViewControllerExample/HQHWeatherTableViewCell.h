//
//  HQHWeatherTableViewCell.h
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/23.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HQHWeatherModel.h"

@interface HQHWeatherTableViewCell : UITableViewCell
@property(nonatomic,strong)HQHWeatherModel *model;
@property(nonatomic,strong)NSMutableArray *modelHourArray;
@property(nonatomic,strong)NSMutableArray *modelInfoArray;

@end
