//
//  NewListTableViewCell.h
//  Sight
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface NewListTableViewCell : UITableViewCell

@property(nonatomic,strong)CellModel *cellModel;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

//封装cell
+(NewListTableViewCell *)newListTableViewCellWithTableView:(UITableView *)tableView;

//设置cell的高
+(CGFloat)cellHeight;
@end
