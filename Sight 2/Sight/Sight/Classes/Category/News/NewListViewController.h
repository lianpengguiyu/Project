//
//  NewListViewController.h
//  Sight
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewListViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *listTableView;

@property (nonatomic,assign)NSInteger newsNum;
@end
