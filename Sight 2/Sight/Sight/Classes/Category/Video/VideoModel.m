//
//  VideoModel.m
//  Sight
//
//  Created by lanou3g on 15/8/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        
        _ID = (NSInteger)value;
        
    }else if([key isEqualToString:@"description"]){
        
        _Description = value;
        
    }
}





@end
