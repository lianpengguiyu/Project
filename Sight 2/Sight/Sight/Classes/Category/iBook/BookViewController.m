//
//  BookViewController.m
//  Sight
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "BookViewController.h"
#import "MyCell.h"
#define kUrl @"http://app.u17.com/v3/app/ios/phone/sort/list?sort"


@interface BookViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *allDataArray;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    //创建collectionView
    [self creatCollectionView];
    
    //请求数据
    [self dataParser];
    
    //给数组开辟空间
    self.allDataArray = [NSMutableArray array];
    
}

#pragma mark 创建collectionView
-(void)creatCollectionView
{
    
    
    
    //创建FlowLtayout(布局视图)
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //item的大小
    layout.itemSize = CGSizeMake(90, 120);
    
    
    //分区内边距
//    layout.sectionInset = UIEdgeInsetsMake(10,10,10,10);
    

    
    //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    
    //创建collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    
    CGRect rect = self.collectionView.frame;
    rect.size.height -= 44;
    
    self.collectionView.frame = rect;
    //将collectionView添加到父视图上
    [self.view addSubview:_collectionView];
    
    //设置代理
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    //注册
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

    
}

#pragma mark -- collectionView的代理方法

//每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSLog(@"%ld",_allDataArray.count);
    return _allDataArray.count;
    
}

//cell
-(MyCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:0.562 green:1.000 blue:0.937 alpha:1.000];
    
    Model *model = self.allDataArray[indexPath.item];
    
    cell.model = model;
    
    return cell;
    
}

//请求数据
-(void)dataParser
{
    //创建网址对象
    NSURL *URL= [NSURL URLWithString:kUrl];
    
    //创建网络请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析请求过来的data
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //接收字典中的小字典
        NSMutableDictionary *dic1 = [dict objectForKey:@"data"];
        //下一级字典
        NSMutableDictionary *dic2 = [dic1 objectForKey:@"returnData"];
        
        NSArray *array = [dic2 objectForKey:@"rankinglist"];
        
        //遍历小字典
        for (NSDictionary *dic3 in array) {
            Model *model = [[Model alloc]init];
            [model setValuesForKeysWithDictionary:dic3];
            [self.allDataArray addObject:model];
            
        }
        
        [self.collectionView reloadData];
        
        
        
        
        
    }];
    
    
    
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
