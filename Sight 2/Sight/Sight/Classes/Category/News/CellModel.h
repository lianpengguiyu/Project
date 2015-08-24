//
//  CellModel.h
//  Sight
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property (nonatomic,strong)NSArray *images;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,assign)NSInteger id;
@property (nonatomic,strong)NSString *title;

@end
