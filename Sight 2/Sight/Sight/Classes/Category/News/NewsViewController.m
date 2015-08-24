//
//  NewsViewController.m
//  Sight
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NewsViewController.h"
#import "DataModel.h"
#import "UIImageView+WebCache.h"

#define webUrl @"http://news-at.zhihu.com/api/4/stories/latest"
@interface NewsViewController ()

@property(nonatomic,strong)NSMutableArray *sotriesArray;
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,assign)CGFloat wScreen;
@property(nonatomic,assign)CGFloat hScreen;

@property (strong, nonatomic) IBOutlet UIView *twoContenView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.headScrollView.showsHorizontalScrollIndicator = YES;
    
    self.wScreen = [UIScreen mainScreen].bounds.size.width;
    self.hScreen = [UIScreen mainScreen].bounds.size.height *1.2/3;
    
    [self dataLoad];
    
     [self loadImage];
    
   
    
//    self.pagControl = [[UIPageControl alloc]init];
//    self.pagControl.frame = CGRectMake(0,0,self.wScreen,self.hScreen/2);
//    [self.headScrollView addSubview:self.pagControl];
    
}

//解析数据
-(void)dataLoad
{
    NSURL *url = [NSURL URLWithString:webUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *storyArray = [dict objectForKey:@"top_stories"];
    _sotriesArray = [NSMutableArray array];
    _imageArray = [NSMutableArray array];

    for (NSDictionary *tempDict in storyArray) {
        DataModel *model = [[DataModel alloc]init];
        [model setValuesForKeysWithDictionary:tempDict];
        [_sotriesArray addObject:model];
      
        [_imageArray addObject:model.image];
     
    }

}


//加载轮播图图片
-(void)loadImage
{
    
    self.headScrollView.pagingEnabled = YES;
    
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.wScreen * 5, self.hScreen)    imageURLsGroup:self.imageArray];
//    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
////    cycleScrollView.titlesGroup =
//    cycleScrollView.autoScrollTimeInterval = 4;
    
    
    for ( int i = 0; i < self.imageArray.count; i++) {
        NSURL *url = [NSURL URLWithString:self.imageArray[i]];
        UIImageView *imaView = [[UIImageView alloc]init];
         imaView.frame = CGRectMake(self.wScreen * i , 0, self.wScreen,self.hScreen);
        [imaView sd_setImageWithURL:url placeholderImage:nil];
       
       
        [self.headScrollView addSubview:imaView];
      
    }
    
    

    

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
