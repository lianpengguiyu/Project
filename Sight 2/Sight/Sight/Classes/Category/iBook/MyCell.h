//
//  MyCell.h
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "UIImageView+WebCache.h"
@interface MyCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *ImgView;

@property (strong, nonatomic) IBOutlet UILabel *nameLable;

@property(nonatomic,strong)Model *model;


@end
