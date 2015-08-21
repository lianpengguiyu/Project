//
//  Model.h
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject


@property(strong,nonatomic)NSString *sortName;//标题
@property(strong,nonatomic)NSString *cover;//图片网址
@property(nonatomic,strong)NSString *argValue;//下级标记值
@property(nonatomic,strong)NSString *argName;//下级标记名字

@end
