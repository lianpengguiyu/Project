//
//  DataModel.h
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *ga_prefix;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,assign)NSInteger id;
@property(nonatomic,assign)BOOL multipic;

@end
