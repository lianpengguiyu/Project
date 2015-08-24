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
#import "SDCycleScrollView.h"
#import "NewListViewController.h"
#import "NewsDetailViewController.h"

#define webUrl @"http://news-at.zhihu.com/api/4/stories/latest"
@interface NewsViewController () <UIScrollViewDelegate>

@property(nonatomic,strong)NSMutableArray *sotriesArray;
//轮播图图片
@property(nonatomic,strong)NSMutableArray *imageArray;
//轮播图title
@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,assign)CGFloat wScreen;
@property(nonatomic,assign)CGFloat hScreen;




@property(nonatomic,strong)NSTimer *timer;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
  
    self.wScreen = [UIScreen mainScreen].bounds.size.width;
    self.hScreen = [UIScreen mainScreen].bounds.size.height *1.2/3;
 
//    加载数据
    [self dataLoad];
//    加载轮播图图片
    [self loadImage];
//    获得首页的button 通过tag值。添加事件
    [self getButton];
//    添加计时器
    [self addTimer];

   
    
}

//获得button

-(void)getButton
{
    
    for (int i = 2; i < 14 ; i++) {
        UIButton *but = (UIButton *)[self.view viewWithTag:100 +i];
        [but  addTarget:self action:@selector(didButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}


//button点击事件(跳到对应的新闻网页)
-(void)didButtonClicked:(UIButton *)button
{
    NewListViewController *newVC = [[NewListViewController alloc]init];
    [self.navigationController pushViewController:newVC animated:YES];
    newVC.newsNum = button.tag - 100;
    
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
    _titleArray = [NSMutableArray array];
    for (NSDictionary *tempDict in storyArray) {
        DataModel *model = [[DataModel alloc]init];
        [model setValuesForKeysWithDictionary:tempDict];
        [_sotriesArray addObject:model];
      
        [_imageArray addObject:model.image];
        [_titleArray addObject:model.title];
     
    }

}


//加载轮播图图片
-(void)loadImage
{
    
    self.headScrollView.pagingEnabled = YES;
    self.headScrollView.showsHorizontalScrollIndicator = YES;
    self.headScrollView.delegate = self;
    
    for ( int i = 0; i < self.imageArray.count; i++) {
        NSURL *url = [NSURL URLWithString:self.imageArray[i]];
        UIImageView *imaView = [[UIImageView alloc]init];
         imaView.frame = CGRectMake(self.wScreen * i , -30 , self.wScreen,self.hScreen * 1.3);
        [imaView sd_setImageWithURL:url placeholderImage:nil];
      
        [self.headScrollView addSubview:imaView];
//        给imaView 添加手势
        imaView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureDidClicked:)];
        [imaView addGestureRecognizer:tap];
        
        //        添加label(设置图片上的说明文字)
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.wScreen * i + 10 , self.hScreen - 100, self.wScreen - 20, 60)];
//        label.backgroundColor = [UIColor cyanColor];
        label.text = self.titleArray[i];
        label.numberOfLines = 2;
        label.textColor = [UIColor whiteColor];
        [self.headScrollView addSubview:label];
        
      
    }
    
    self.headScrollView.contentSize = CGSizeMake(self.wScreen * 5, 0);
    
    self.pagControl.numberOfPages = self.imageArray.count;
   
}

//实现轻拍事件., 跳转到详情界面。
-(void)tapGestureDidClicked:(UITapGestureRecognizer *)tap
{
    NSLog(@"ni hao%ld",self.pagControl.currentPage);
    NSInteger num = self.pagControl.currentPage;
    DataModel *model = self.sotriesArray[num];
    NewsDetailViewController *newVC = [[NewsDetailViewController alloc]init];
    [self.navigationController pushViewController:newVC animated:YES];
    newVC.storiesID = model.id;
    
    
}

//添加定时器
-(void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
//移除定时器
-(void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
//显示哪一页
-(void)nextPage
{
    int page = 0;
    
    if (self.pagControl.currentPage == 4) {
        page = 0;
    }else{
        page = self.pagControl.currentPage +1;
    }
    CGFloat contentofSexX = page * self.headScrollView.frame.size.width;
    
    CGPoint contentSexP = CGPointMake(contentofSexX, 0);
    [self.headScrollView setContentOffset:contentSexP animated:YES];
    
    
}

#pragma mark _代理方法
//当scrollView正在滚动就会调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5)/scrollW;
    self.pagControl.currentPage = page;
}
//开始拖拽的时候调用
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self removeTimer];
}
//停止拖拽的时候调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
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
