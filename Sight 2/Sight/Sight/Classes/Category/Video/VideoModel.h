//
//  VideoModel.h
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property(nonatomic,copy)NSString *category;
@property(nonatomic,copy)NSString *Description;
@property(nonatomic,copy)NSString *playUrl;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *rawWebUrl;// 网页版详情
@property(nonatomic,copy)NSString *coverForSharing;// 图片
@property(nonatomic,assign)NSInteger ID;
@property(nonatomic,assign)NSInteger idx;
@property(nonatomic,assign)NSInteger date;
@property(nonatomic,assign)NSInteger duration;// 时长


@end
