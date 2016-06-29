//
//  HQHWeatherTableViewCell.m
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/23.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import "HQHWeatherTableViewCell.h"
#import "HQHTableView.h"
#import "Masonry.h"
#import "NetTool.h"
#import "HQHWeatherModel.h"
#import "HQHWeatherHourModel.h"
#import "HQHInFoModel.h"

@interface HQHWeatherTableViewCell ()


//城市
@property(nonatomic,strong)UILabel *cityLabel;
//天气
@property(nonatomic,strong)UILabel *weatherLabel;
//温度
@property(nonatomic,strong)UILabel *wenDuLabel;

//hour时间
@property(nonatomic,strong)NSMutableArray *timeHourLabelArr;
//hour天气
@property(nonatomic,copy)NSMutableArray *weathHourLabelArr;
//hour温度
@property(nonatomic,copy)NSMutableArray *wenDuHourLabelArr;

//体感
@property(nonatomic,strong)UIButton *tiGanButton;
//感冒
@property(nonatomic,strong)UIButton *ganMaoButton;
//污染
@property(nonatomic,strong)UIButton *wuRanButton;
//洗车
@property(nonatomic,strong)UIButton *xiCheButton;
@property(nonatomic,copy)NSMutableArray *modelArray;
@property(nonatomic,strong)UIView *weatherLineView;
@property(nonatomic,strong)UIScrollView *weatherLineScrollView;
@property(nonatomic,strong)UITableView *weatherTableView;
@property(nonatomic,strong)UIView *lineView1;
@property(nonatomic,strong)UIView *lineView2;
@property(nonatomic,strong)UIView *lineView3;
@property(nonatomic,strong)UIView *lineView4;
@property(nonatomic,strong)UIView *lineView5;
@property(nonatomic,strong)UIView *lineView6;
@property(nonatomic,assign)CGFloat average;
@property(nonatomic,strong)UIButton *temButton;
@property(nonatomic,copy)NSMutableString *temString;
@property(nonatomic,strong)UILabel *temLabel;
@property(nonatomic,strong)UILabel *infoLabel;
@end


@implementation HQHWeatherTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *cityLabel=[[UILabel alloc]init];
        [self.contentView addSubview:cityLabel];
        self.cityLabel=cityLabel;
        //        cityLabel.backgroundColor=[UIColor redColor];
        cityLabel.textColor=[UIColor whiteColor];
        cityLabel.textAlignment=NSTextAlignmentCenter;
        cityLabel.font=[UIFont systemFontOfSize:24];
        cityLabel.text=@"北京";
        
        UILabel *weatherLabel=[[UILabel alloc]init];
        [self.contentView addSubview:weatherLabel];
        self.weatherLabel=weatherLabel;
        //        weatherLabel.backgroundColor=[UIColor blueColor];
        weatherLabel.textColor=[UIColor whiteColor];
        weatherLabel.textAlignment=NSTextAlignmentCenter;
        weatherLabel.font=[UIFont systemFontOfSize:15];
//        weatherLabel.text=@"雷阵雨转晴";
        
        UILabel *wenDuLabel=[[UILabel alloc]init];
        [self.contentView addSubview:wenDuLabel];
        self.wenDuLabel=wenDuLabel;
        //        wenDuLabel.backgroundColor=[UIColor redColor];
        wenDuLabel.textColor=[UIColor whiteColor];
        wenDuLabel.textAlignment=NSTextAlignmentCenter;
        wenDuLabel.font=[UIFont systemFontOfSize:60];
//        wenDuLabel.text=@"27";
        self.wenDuLabel=wenDuLabel;
        
        [self addWeatherLine];
        
        
    }
    return self;
}

-(void)addInFoButton{
    UIButton *tiGanButton=[[UIButton alloc]init];
    [self.contentView addSubview:tiGanButton];
    tiGanButton.tag=0;
    self.tiGanButton=tiGanButton;
    //        tiGanButton.backgroundColor=[UIColor blueColor];
    [tiGanButton setTitle:@"体感温度" forState:UIControlStateNormal];
    tiGanButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [tiGanButton addTarget:self action:@selector(tiGanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addInFo:tiGanButton];
    
    UIButton *ganMaoButton=[[UIButton alloc]init];
    [self.contentView addSubview:ganMaoButton];
    ganMaoButton.tag=1;
    self.ganMaoButton=ganMaoButton;
    //        ganMaoButton.backgroundColor=[UIColor redColor];
    [ganMaoButton setTitle:@"感冒" forState:UIControlStateNormal];
    ganMaoButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [ganMaoButton addTarget:self action:@selector(ganMaoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *wuRanButton=[[UIButton alloc]init];
    [self.contentView addSubview:wuRanButton];
    wuRanButton.tag=2;
    self.wuRanButton=wuRanButton;
    //        wuRanButton.backgroundColor=[UIColor blueColor];
    [wuRanButton setTitle:@"污染" forState:UIControlStateNormal];
    wuRanButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [wuRanButton addTarget:self action:@selector(wuRanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *xiCheButton=[[UIButton alloc]init];
    [self.contentView addSubview:xiCheButton];
    xiCheButton.tag=3;
    self.xiCheButton=xiCheButton;
    //        xiCheButton.backgroundColor=[UIColor redColor];
    [xiCheButton setTitle:@"洗车" forState:UIControlStateNormal];
    xiCheButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [xiCheButton addTarget:self action:@selector(xiCheButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView3=[[UIView alloc]init];
    [self.contentView addSubview:lineView3];
    lineView3.backgroundColor=[UIColor whiteColor];
    self.lineView3=lineView3;
    UIView *lineView4=[[UIView alloc]init];
    [self.contentView addSubview:lineView4];
    lineView4.backgroundColor=[UIColor whiteColor];
    self.lineView4=lineView4;
    UIView *lineView5=[[UIView alloc]init];
    [self.contentView addSubview:lineView5];
    lineView5.backgroundColor=[UIColor whiteColor];
    self.lineView5=lineView5;
    UIView *lineView6=[[UIView alloc]init];
    [self.contentView addSubview:lineView6];
    lineView6.backgroundColor=[UIColor whiteColor];
    self.lineView6=lineView6;
}

-(void)tiGanButtonClick:(UIButton *)button{
    NSLog(@"tiGanButtonClick");
    [self addInFo:button];
    
    
    
}
-(void)ganMaoButtonClick:(UIButton *)button{
    [self addInFo:button];
    
}
-(void)wuRanButtonClick:(UIButton *)button{
    [self addInFo:button];
    
}
-(void)xiCheButtonClick:(UIButton *)button{
    [self addInFo:button];
    
}
-(void)addInFo:(UIButton *)button{
    [self.temButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.temLabel.text=nil;
    [button setTitle:button.titleLabel.text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    self.temButton=button;
    
    UILabel *infoLabel=[[UILabel alloc]init];
    [self.contentView addSubview:infoLabel];
    self.temLabel=infoLabel;
    infoLabel.textColor=[UIColor whiteColor];
    infoLabel.textAlignment=NSTextAlignmentLeft;
    infoLabel.font=[UIFont systemFontOfSize:14];
    if (self.modelInfoArray.count==0) {
        self.temLabel.text=@"没网";
        return;
    }
    
    
    HQHInFoModel *model=self.modelInfoArray[button.tag];
    self.temString=[NSString stringWithFormat:@"%@:%@   提醒：%@",model.type,model.shortDesc,model.longDesc];
    infoLabel.text=self.temString;
    self.temString=nil;
    infoLabel.numberOfLines=0;
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView3).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        
    }];
    self.infoLabel=infoLabel;
    
}



-(void)setModel:(HQHWeatherModel *)model{
    _model=model;
    self.cityLabel.text=@"北京";
    self.weatherLabel.text=model.tq1;
    
    self.wenDuLabel.text=model.qw1;
    
}
-(void)setModelHourArray:(NSMutableArray *)modelHourArray{
    _modelHourArray=modelHourArray;
    for (int i = 0; i < modelHourArray.count; i++) {
        if (i>23) {
            return;
        }
        HQHWeatherHourModel *model=modelHourArray[i];
        UILabel *timeLabelHour=self.timeHourLabelArr[i];
        NSString *time=[model.sj substringWithRange:NSMakeRange(11,5)];
        timeLabelHour.text=time;
        UILabel *weathHourLabel=self.weathHourLabelArr[i];
        weathHourLabel.text=model.tq;
        UILabel *wenDuHourLabel=self.wenDuHourLabelArr[i];
        wenDuHourLabel.text=model.qw;
    }
    
 }
-(void)setModelInfoArray:(NSMutableArray *)modelInfoArray{
    _modelInfoArray=modelInfoArray;
    [self addInFoButton];
}



-(void)layoutSubviews{
    
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(44);
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(44);
    }];
    [self.weatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cityLabel.mas_bottom);
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(24);
    }];
    [self.wenDuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weatherLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(64);
    }];
    
    
    [self.weatherLineScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wenDuLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(100);
    }];
    [self.weatherTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weatherLineView.mas_bottom);
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(300);
        
    }];
    //
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weatherLineView).offset(0);
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(0.3);
    }];
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.weatherLineView.mas_bottom).offset(-1);
        make.leading.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(0.3);
    }];
    
    
    
    [self.tiGanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weatherLineScrollView.mas_bottom);
        make.height.mas_equalTo(50);
        make.left.equalTo(self.contentView);
    }];
    [self.ganMaoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.width.and.height.equalTo(self.tiGanButton);
        make.left.equalTo(self.tiGanButton.mas_right);
    }];
    [self.wuRanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.width.and.height.equalTo(self.ganMaoButton);
        make.left.equalTo(self.ganMaoButton.mas_right);
    }];
    [self.xiCheButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.width.and.height.equalTo(self.wuRanButton);
        make.left.equalTo(self.wuRanButton.mas_right);
        make.right.equalTo(self.contentView.mas_right);
    }];
    [self.lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(self.contentView);
        make.bottom.equalTo(self.xiCheButton);
        make.height.mas_equalTo(0.5);
        
    }];
    [self.lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tiGanButton.mas_right);
        make.bottom.equalTo(self.lineView3).offset(-10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(0.5);
        
    }];
    [self.lineView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ganMaoButton.mas_right);
        make.bottom.equalTo(self.lineView3).offset(-10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(0.5);
        
    }];
    [self.lineView6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.wuRanButton.mas_right);
        make.bottom.equalTo(self.lineView3).offset(-10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(0.5);
        
    }];
    
    
    
    
    
}




-(void)addWeatherLine{
    UIScrollView *weatherLineScrollView=[[UIScrollView alloc]init];
    weatherLineScrollView.contentSize=CGSizeMake(1220, 100);
    weatherLineScrollView.bounces=NO;
    UIView *weatherLineView=[[UIView alloc]init];
    weatherLineView.frame=CGRectMake(0, 0, 1220, 100);
    [self.contentView addSubview:weatherLineScrollView];
    [weatherLineScrollView addSubview:weatherLineView];
    self.weatherLineView=weatherLineView;
    self.weatherLineScrollView=weatherLineScrollView;
    
    UIView *lineView1=[[UIView alloc]init];
    [self.contentView addSubview:lineView1];
    self.lineView1=lineView1;
    lineView1.backgroundColor=[UIColor whiteColor];
    [self addButton];
    UIView *lineView2=[[UIView alloc]init];
    [self.contentView addSubview:lineView2];
    self.lineView2=lineView2;
    lineView2.backgroundColor=[UIColor whiteColor];
  }


-(void)addButton{
    
    for (int i=0;i<24; i++ ) {
        
        CGFloat X=i*50+30;
        
        
        UILabel *timeHourLabel=[[UILabel alloc]init];
        [self.weatherLineView addSubview:timeHourLabel];
        [self.timeHourLabelArr insertObject:timeHourLabel atIndex:i];
        
        
        timeHourLabel.center=CGPointMake(X, 20);
        timeHourLabel.bounds=CGRectMake(0, 0, 60, 20);
        timeHourLabel.textColor=[UIColor whiteColor];
        timeHourLabel.textAlignment=NSTextAlignmentCenter;
        timeHourLabel.font=[UIFont systemFontOfSize:15];
        
        UILabel *weathHourLabel=[[UILabel alloc]init];
        [self.weatherLineView addSubview:weathHourLabel];
        [self.weathHourLabelArr insertObject:weathHourLabel atIndex:i];
        
        weathHourLabel.center=CGPointMake(X, 50);
        weathHourLabel.bounds=CGRectMake(0, 0, 60, 30);
        weathHourLabel.textColor=[UIColor whiteColor];
        weathHourLabel.textAlignment=NSTextAlignmentCenter;
        weathHourLabel.font=[UIFont systemFontOfSize:15];
        
        UILabel *wenDuHourLabel=[[UILabel alloc]init];
        [self.weatherLineView addSubview:wenDuHourLabel];
        [self.wenDuHourLabelArr insertObject:wenDuHourLabel atIndex:i];
        wenDuHourLabel.center=CGPointMake(X, 80);
        wenDuHourLabel.bounds=CGRectMake(0, 0, 60, 30);
        wenDuHourLabel.textColor=[UIColor whiteColor];
        wenDuHourLabel.textAlignment=NSTextAlignmentCenter;
        wenDuHourLabel.font=[UIFont systemFontOfSize:15];
        
        
        
        
    }
    
    
    
}


-(NSMutableArray *)timeHourLabelArr{
    if (_timeHourLabelArr==nil) {
        _timeHourLabelArr=[NSMutableArray array];
    }
    return _timeHourLabelArr;
}

-(NSMutableArray *)weathHourLabelArr{
    if (_weathHourLabelArr==nil) {
        _weathHourLabelArr=[NSMutableArray array];
    }
    return _weathHourLabelArr;
}
-(NSMutableArray *)wenDuHourLabelArr{
    if (_wenDuHourLabelArr==nil) {
        _wenDuHourLabelArr=[NSMutableArray array];
    }
    return _wenDuHourLabelArr;
}




@end
