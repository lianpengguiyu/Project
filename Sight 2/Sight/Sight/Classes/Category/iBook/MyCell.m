//
//  MyCell.m
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

-(void)setModel:(Model *)model
{
    //使用SDWebImages方法下载图片
    NSURL *url = [NSURL URLWithString:model.cover];
    [self.ImgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"backImage"]];
    
    self.nameLable.text = model.sortName;
}
@end

