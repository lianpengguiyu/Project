//
//  VideoCell.h
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImageView+WebCache.h"

#import "VideoModel.h"

@interface VideoCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (strong, nonatomic) IBOutlet UILabel *titleLable;


@property (strong, nonatomic) IBOutlet UILabel *classLabel;




// 给cell进行赋值
-(void)setCellDataWithModel:(VideoModel *)model;

@end
