//
//  NewListWithoutImageCell.h
//  Sight
//
//  Created by lanou3g on 15/8/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface NewListWithoutImageCell : UITableViewCell

@property(nonatomic,strong)CellModel *cellmodel;
@property (strong, nonatomic) IBOutlet UILabel *noImageCelllabel;

@end
