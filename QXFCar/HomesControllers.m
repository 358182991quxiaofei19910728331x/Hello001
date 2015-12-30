//
//  HomesControllers.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/19.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "HomesControllers.h"

#import "Define.h"

#import <WebKit/WebKit.h>
@interface HomesControllers () <UIWebViewDelegate> {
    NSString *_requsetUrl;
    NSURLRequest *_requset;
}

@property (nonatomic) WKWebView *webView;

@end

@implementation HomesControllers
/*
 #define XHome1URL @"http://h5.ycapp.yiche.com/news/%@.html?appver=6.6&lastmodify=%@&plat=1"
 
 //酷图
 #define XHome3URL @"http://api.ycapp.yiche.com/appnews/GetNewsAlbum?newsid=%@&lastmodify=%@"
 //评测//导购//新车
 #define XHome4URL @"http://h5.ycapp.yiche.com/ycnews/%@.html?appver=6.6&lastmodify=%@&plat=1"
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[WKWebView alloc]init];
    _webView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
   
    [self.view addSubview:_webView];
    if ([_categoryType isEqualToString:QHome1Type]) {
        _requsetUrl = [NSString stringWithFormat:XHome1URL,_applicationID,_lastmodify];
       _requset = [NSURLRequest requestWithURL:[NSURL URLWithString:_requsetUrl]];
    }
    if ([_categoryType isEqualToString:QHome2Type] || [_categoryType isEqualToString:QHome4Type] || [_categoryType isEqualToString:QHome5Type]) {
        _requsetUrl = [NSString stringWithFormat:XHome3URL,_applicationID,_lastmodify];
        _requset = [NSURLRequest requestWithURL:[NSURL URLWithString:_requsetUrl]];
    }
    
    [_webView loadRequest:_requset];
    // Do any additional setup after loading the view.
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
