//
//  NetTool.m
//  RippleTableViewControllerExample
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 clooket.com. All rights reserved.
//

#import "NetTool.h"


@implementation NetTool

+ (instancetype)sharedToolManager
{
    // 存放在内存中的静态区
    static NetTool *toolManager;
    
    // 保证只实例化了一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toolManager = [[NetTool alloc] init];
    });
    return toolManager;
}

-(NSMutableArray *)modelArray{
    if (_modelArray==nil) {
        _modelArray=[NSMutableArray array];
    }
    return _modelArray;
}


-(void)getWithUrl:(NSString *)URLString success:(void (^)(NSDictionary *))successDict failure:(void (^)(NSError *))failure{
    
//        NSURL *url = [NSURL URLWithString:@"http://api.yytianqi.com/forecast7d?city=39.93,116.40&key=sfdb6rtqbntv8ise"];
        NSURL *url = [NSURL URLWithString:URLString];
    
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
        // 1.实例化网络会话: NSUrlSession
        NSURLSession *session = [NSURLSession sharedSession];
    
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (error==nil) {
                NSDictionary *result=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                //        NSLog(@"result:%@",result);
//                
//                NSDictionary *DD=result[@"data"];
//                NSArray *list=DD[@"list"];
//                
//                        NSLog(@"list:%@",list);
//                //        HQHWeatherModel *model=[HQHWeatherModel modelWithDict:list[0]];
//                //        NSLog(@"model:%@",model.qw1);
//                for (int i = 0; i < list.count; i++) {
//                    HQHWeatherModel *model=[HQHWeatherModel modelWithDict:list[i]];
//                    [self.modelArray addObject:model];
//                    
////                    NSLog(@"呵呵model:%@",model.qw);
//                    
//                }
//                
                
                successDict(result);
            }else{
                failure(error);
            }
            
        
            
        }];
        
        
        // 3. 开启网络任务;网络任务实例化成功之后,默认处于挂起状态,需要手动开启(重启).
        [task resume];
        
                
    
    
}

//-(void)getWithUrl:(NSString *)url andSuccess:(void (^)(NSMutableArray * modelArray))success{
//    
//    url = [NSURL URLWithString:@"http://api.yytianqi.com/forecast7d?city=39.93,116.40&key=sfdb6rtqbntv8ise"];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    // 普通网络任务.
//    
//    // 利用 NSUrlSession 发送网络请求.
//    
//    // NSUrlSession 使用:
//    
//    // 1.实例化网络会话: NSUrlSession
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    // 2.根据网络会话,实例化网络任务.
//    // 网络任务
//    // 1.NSURLSessionDataTask :普通网络任务.
//    // 2.NSURLSessionDownloadTask :下载网络任务.
//    // 3.NSURLSessionUploadTask :上传网络任务.
//    
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        // data :实体内容.
//        // response: 响应头
//        // error :错误信息/连接错误
//        
//        //        UIImage *image = [UIImage imageWithData:data];
//        
//        //        NSLog(@"image:%@",data);
//        
//        NSDictionary *result=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//        //        NSLog(@"result:%@",result);
//        
//        NSDictionary *DD=result[@"data"];
//        NSArray *list=DD[@"list"];
//        
//        //        NSLog(@"list:%@",list);
//        //        HQHWeatherModel *model=[HQHWeatherModel modelWithDict:list[0]];
//        //        NSLog(@"model:%@",model.qw1);
//        for (int i = 0; i < list.count; i++) {
//            HQHWeatherModel *model=[HQHWeatherModel modelWithDict:list[i]];
//            [self.modelArray addObject:model];
//                        NSLog(@"model:%@",model.tq2);
//            
//        }
//        
//        
//    }];
//    
//    
//    // 3. 开启网络任务;网络任务实例化成功之后,默认处于挂起状态,需要手动开启(重启).
//    [task resume];
//    
//    // 注意: NSUrlSession 默认都是异步的.没有同步请求.
//    // 替代 NSUrlConnection 中所有的异步请求.
//    
//    
//    
//    
//
//}
@end
