//
//  HQHTableView.m
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/23.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import "HQHTableView.h"
#import "NetTool.h"
#import "HQHWeatherModel.h"
#import "HQHWeatherTableViewCell.h"
#import "HQHWeatherHourModel.h"
#import "HQHInFoModel.h"

@interface HQHTableView ()

@property(nonatomic,copy)NSMutableArray *modelArray;
@property(nonatomic,copy)NSMutableArray *modelHourArray;
@property(nonatomic,copy)NSMutableArray *modelInfoArray;
@property(nonatomic,strong)UIView *redView;

@end




@implementation HQHTableView

-(instancetype)init{
    if (self==[super init]) {
        [self addWangLuo];
        [self addWangLuoHour];
        [self addInfoWangLuo];
        
        UIView *redView=[[UIView alloc]init];
        [self addSubview:redView];
//        redView.backgroundColor=[UIColor blueColor];
        redView.frame=CGRectMake(0, 0, 333, 150);
        self.redView=redView;
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        [self.redView addGestureRecognizer:panGesture];
        
    }
    return self;
}


-(void) panGesture:(id)sender{
        UIPanGestureRecognizer *panGesture = sender;
        CGPoint movePoint = [panGesture translationInView:self.redView];
    
        if (movePoint.y>20.0) {
            NSLog(@"哈哈哈哈哈哈和哈哈哈哈哈哈");
            
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [self addWangLuo];
                [self addWangLuoHour];
                [self addInfoWangLuo];
            });
           
        }

    }


-(NSMutableArray *)modelArray{
    if (_modelArray==nil) {
        _modelArray=[NSMutableArray array];
    }
    return _modelArray;
}

-(NSMutableArray *)modelHourArray{
    if (_modelHourArray==nil) {
        _modelHourArray=[NSMutableArray array];
    }
    return _modelHourArray;
}
-(NSMutableArray *)modelInfoArray{
    if (_modelInfoArray==nil) {
        _modelInfoArray=[NSMutableArray array];
    }
    return _modelInfoArray;
}

-(void)addWangLuo{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NetTool sharedToolManager] getWithUrl:@"http://api.yytianqi.com/forecast7d?city=39.93,116.40&key=sfdb6rtqbntv8ise" success:^(NSDictionary *successDict) {
            NSDictionary *DD=successDict[@"data"];
            NSArray *list=DD[@"list"];
            self.modelArray=nil;
            for (int i = 0; i < list.count; i++) {
                HQHWeatherModel *model=[HQHWeatherModel modelWithDict:list[i]];
                [self.modelArray addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self reloadData];
            });
        } failure:^(NSError *error) {
            NSLog(@"error:%@",error);
            
        }];
    });
}

-(void)addWangLuoHour{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NetTool sharedToolManager] getWithUrl:@"http://api.yytianqi.com/weatherhours?city=39.93,116.40&key=qklhd1n68e6b5d5f" success:^(NSDictionary *successDict) {
            NSDictionary *DD=successDict[@"data"];
            NSArray *list=DD[@"list"];
            self.modelHourArray=nil;
            for (int i = 0; i < list.count; i++) {
                HQHWeatherHourModel *model=[HQHWeatherHourModel modelWithDict:list[i]];
                [self.modelHourArray addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self reloadData];
            });
        } failure:^(NSError *error) {
            NSLog(@"error:%@",error);
        }];
    });
}

-(void)addInfoWangLuo{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NetTool sharedToolManager] getWithUrl:@"http://api.yytianqi.com/weatherindex?city=39.93,116.40&key=qklhd1n68e6b5d5f" success:^(NSDictionary *successDict) {
            NSDictionary *DD=successDict[@"data"];
            NSArray *list=DD[@"list"];
            self.modelInfoArray=nil;
            for (int i = 0; i < list.count; i++) {
                HQHInFoModel *model=[HQHInFoModel modelWithDict:list[i]];
                [self.modelInfoArray addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self reloadData];
            });
        } failure:^(NSError *error) {
            NSLog(@"error:%@",error);
        }];
    });
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *key=@"cellKey";
    HQHWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:key];
    if (cell==nil) {
        cell=[[HQHWeatherTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key];
    }
    cell.backgroundColor=[UIColor clearColor];
    //    cell.contentView.backgroundColor=[UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.modelHourArray!=nil) {
        cell.modelHourArray=self.modelHourArray;
    }
    if (self.modelArray.count>0) {
        HQHWeatherModel *model=self.modelArray[0];
        cell.model=model;
    }
    if (self.modelInfoArray!=nil) {
        cell.modelInfoArray=self.modelInfoArray;
    }
    
    
    return cell;
}


@end
