//
//  NewListWithoutImageCell.m
//  Sight
//
//  Created by lanou3g on 15/8/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NewListWithoutImageCell.h"

@implementation NewListWithoutImageCell


-(void)setCellmodel:(CellModel *)cellmodel
{
    _cellmodel = cellmodel;
    self.noImageCelllabel.text = cellmodel.title;
    
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
