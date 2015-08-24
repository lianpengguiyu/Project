//
//  NewListViewController.m
//  Sight
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NewListViewController.h"
#import "NewListTableViewCell.h"
#import "NewsDetailViewController.h"
#import "NewListWithoutImageCell.h"
#import "CellModel.h"
#import "MJRefresh.h"

#define themeUrl @"http://news-at.zhihu.com/api/4/theme/"
@interface NewListViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *storiesArray;



@end

@implementation NewListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
// 遵守tableView的协议
    self.listTableView.dataSource = self;
    self.listTableView.delegate = self;
    
// 注册cell
    UINib *nib =[UINib nibWithNibName:@"NewListTableViewCell" bundle:nil];
    [self.listTableView registerNib:nib forCellReuseIdentifier:@"cell_id"];
    
    UINib *cellNib =[UINib nibWithNibName:@"NewListWithoutImageCell" bundle:nil];
    [self.listTableView registerNib:cellNib forCellReuseIdentifier:@"cell"];
    
 // 设置headerView
    CGRect frame = [[UIScreen mainScreen]bounds];
  
    self.listTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.width*0.4)];
    UIImageView *imaView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.width*0.4)];
    imaView.image = [UIImage imageNamed:@"1.jpg"];
    [self.listTableView.tableHeaderView addSubview:imaView];
    
    self.listTableView.tableHeaderView.backgroundColor = [UIColor cyanColor];

//  解析数据
    [self dataParse];
    
    [self.listTableView reloadData];
    
    
    [self.listTableView addHeaderWithTarget:self action:@selector(headUpData)];
    [self.listTableView addFooterWithTarget:self action:@selector(footUpData)];
   
    
    
    
    
//   [self.listTableView headerBeginRefreshing];
   // [self.listTableView footerBeginRefreshing];
    
    
//      [self.listTableView reloadData];
 
}

-(void)headUpData
{
//    [self dataParse];
    
    [self.listTableView reloadData];
    [self.listTableView headerBeginRefreshing];
    [self.listTableView  headerEndRefreshing];
}

-(void)footUpData
{
    CellModel *model = self.storiesArray.lastObject;
    NSString *strUrl = [NSString stringWithFormat:@"%@%ld/before/%ld",themeUrl,self.newsNum,model.id];
    NSLog(@"%@",strUrl);
//    [self.storiesArray removeAllObjects];

    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:strUrl]];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray * tempArray = [dict objectForKey:@"stories"];
    for (NSDictionary *dict in tempArray) {
        CellModel *model = [[CellModel alloc]init];
        [model setValuesForKeysWithDictionary:dict];
        [self.storiesArray addObject:model];
        
        
    }
    
    [self.listTableView reloadData];
    
    
    
//    [self.listTableView footerBeginRefreshing];
    [self.listTableView footerEndRefreshing];
    
}






-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
     NSArray *array = [NSArray arrayWithObjects:@"开始游戏",@"电影日报",@"设计日报",@"大公司日报",@"财经日报",@"音乐日报",@"体育日报",@"动漫日报",@"互联网完全",@"不许无聊",@"用户推荐日报",@"日常心理学", nil];
    NSString *title = array[self.newsNum-2];
    [title sizeWithFont:[UIFont systemFontOfSize:30]];
    return title;
    
    
}



//解析
-(void)dataParse
{
    
    NSString *str = [themeUrl stringByAppendingString:[NSString stringWithFormat:@"%ld",self.newsNum] ];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *array = [dict objectForKey:@"stories"];
    self.storiesArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        CellModel *model = [[CellModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.storiesArray addObject:model];
 
    }
    

}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回cell的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.storiesArray.count;
}


//对cell进行赋值
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    CellModel * model = self.storiesArray[indexPath.row];
    
    
    if (model.images) {
     
        static NSString *ID = @"cell_id";
        NewListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
        cell.cellModel = self.storiesArray[indexPath.row];
            return cell;

    }else{
        static NSString *ID = @"cell";
        
        NewListWithoutImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
       
        cell.cellmodel = self.storiesArray[indexPath.row];
        return cell;
    }
    


//    return cell;
}
//返回cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
//点击cell触发点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController *newVC = [[NewsDetailViewController alloc]init];
//    self.navigationItem.backBarButtonItem.title = @"返回";
    [self.navigationController pushViewController:newVC animated:YES];
    
    CellModel *model = self.storiesArray[indexPath.row];
    newVC.storiesID = model.id;
    
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
