//
//  NewListTableViewCell.m
//  Sight
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NewListTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface NewListTableViewCell ()


@end

@implementation NewListTableViewCell



-(void)setCellModel:(CellModel *)cellModel
{
    _cellModel = cellModel;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:cellModel.images[0]] placeholderImage:nil];
    
    self.label.text = cellModel.title;
    
    
}

//+(NewListTableViewCell *)newListTableViewCellWithTableView:(UITableView *)tableView
//{
//    static NSString *ID = @"cell_id";
//    NewListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (!cell) {
//        cell = [[NewListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_id"];
//    }
//    return cell;
//}

+(CGFloat)cellHeight
{
    return 100;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
