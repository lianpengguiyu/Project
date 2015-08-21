//
//  RootViewController.m
//  Sight
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RootViewController.h"

#import "PrefixHeader.pch"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor cyanColor];
    
    BookViewController *bookVC = [[BookViewController alloc]init];
    UINavigationController *bookNC = [[UINavigationController alloc]initWithRootViewController:bookVC];
    bookNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"book" image:[UIImage imageNamed:@""] tag:101];
    
    
    NewsViewController *newsVC = [[NewsViewController alloc]init];
    UINavigationController *newsNC = [[UINavigationController alloc]initWithRootViewController:newsVC];
    newsNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"news" image:[UIImage imageNamed:@""] tag:102];
    
    VideoViewController *videoVC = [[VideoViewController alloc]init];
    UINavigationController *videoNC = [[UINavigationController alloc]initWithRootViewController:videoVC];
    videoNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"video" image:[UIImage imageNamed:@""] tag:103];
    
    
    NSArray *tabArray = @[bookNC,newsNC,videoNC];
    [self setViewControllers:tabArray animated:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
