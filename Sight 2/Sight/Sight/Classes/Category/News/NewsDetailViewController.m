//
//  NewsDetailViewController.m
//  Sight
//
//  Created by lanou3g on 15/8/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NewsDetailViewController.h"
#define detailUrl @"http://news-at.zhihu.com/api/4/story/"
@interface NewsDetailViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *newsWebView;

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] init];
//    self.navigationItem.leftBarButtonItem = leftButton;
//    self.navigationItem.title = @"返回";
    
//    _newsWebView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:_newsWebView];
    
    NSString *urlStr = [detailUrl stringByAppendingString:[NSString stringWithFormat:@"%ld",self.storiesID]];
    
    
    NSURLRequest *url =[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    [NSURLConnection sendAsynchronousRequest:url queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSString *htmlString = [dict objectForKey:@"body"];
        NSMutableString *string = [NSMutableString stringWithString:htmlString];
        
        [self changeString:string];
        
        [self.newsWebView loadHTMLString:string baseURL:nil];
        
        
    }];
 

}

//
-(void)changeString:(NSMutableString *)HtmlString
{
    NSString *string = @".jpg";
    NSString *string1 = @".gif";
    
    NSString *insertString= @"style=\"display:block;width:100%;\"";
    for (int i =0; i<HtmlString.length - string.length +1; i++) {
        if ([[HtmlString substringWithRange:NSMakeRange(i, string.length)] isEqualToString:string] || [[HtmlString substringWithRange:NSMakeRange(i, string.length)] isEqualToString:string1]) {
           
            [HtmlString insertString:insertString atIndex:i + 5];
        }
    }

    NSString *string2 = @"_is.jpg";
    for (int i = 0; i < HtmlString.length - string2.length +1; i++) {
        if ([[HtmlString substringWithRange:NSMakeRange(i, string2.length)]isEqualToString:string2]) {
            [HtmlString deleteCharactersInRange:NSMakeRange(i + 8, 33)];
        }
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
