//
//  VideoManager.h
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoManager : NSObject

@property(nonatomic,strong)NSMutableArray * dataArray;

// 单例
+(VideoManager *)sharedManager;

#pragma mark - 网络请求数据
-(void)requestDataWithUrl:(NSString *)url result:(void(^)(NSMutableArray *array))block;


@end
