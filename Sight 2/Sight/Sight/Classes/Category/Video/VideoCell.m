//
//  VideoCell.m
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell


// 给cell进行赋值
-(void)setCellDataWithModel:(VideoModel *)model{
    
    self.titleLable.text = model.title;
    self.classLabel.text = [NSString stringWithFormat:@"%ld",model.date];
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.coverForSharing] placeholderImage:[UIImage imageNamed:@"xiaohe.jpg"]];
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
