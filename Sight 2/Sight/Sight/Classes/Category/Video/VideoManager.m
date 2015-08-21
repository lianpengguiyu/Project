//
//  VideoManager.m
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "VideoManager.h"

#import "VideoModel.h"

@interface VideoModel ()



@end


@implementation VideoManager

// 单例
+(VideoManager *)sharedManager{
    
    static VideoManager *videoManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        videoManager = [[VideoManager alloc]init];
    });
    
    return videoManager;
}

// 懒加载
-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

// 网络请求数据
-(void)requestDataWithUrl:(NSString *)url result:(void(^)(NSMutableArray *array))block{
    
    NSURL *url1 = [NSURL URLWithString:url];
    
        NSURLRequest *request = [NSURLRequest requestWithURL:url1];
    

        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil ];
            NSArray *array = [dic objectForKey:@"dailyList"];
            NSDictionary *dic1 = [array firstObject];
            NSArray *array1 = [dic1 objectForKey:@"videoList"];
            for (NSDictionary *dict in array1) {
                VideoModel *model = [[VideoModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                
                [self.dataArray addObject:model];
            }
            
                                   block(self.dataArray);
        }];
    




}




@end
