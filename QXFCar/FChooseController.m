//
//  FChooseController.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/21.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "FChooseController.h"
#import "FChooesModel.h"
#import "Define.h"
#import <AFNetworking/AFNetworking.h>
#import <WebKit/WebKit.h>
@interface FChooseController () <UIWebViewDelegate> {
    NSString *_requsetUrl;
    NSURLRequest *_requset;
    NSMutableArray *_dataArray;
}
@property (nonatomic) WKWebView *webView;
@end

@implementation FChooseController


- (void)createwebView:(NSString *)url{
    _webView = [[WKWebView alloc]init];
    _webView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    
    [self.view addSubview:_webView];
    _requset = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
   
    [_webView loadRequest:_requset];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray new];
    // Do any additional setup after loading the view.
    
    [self manager];
   
}

- (void) manager {
    _requsetUrl = [NSString stringWithFormat:FChooseURL,_applicationID];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:_requsetUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        FChooesModel *model = [[FChooesModel alloc]initWithDictionary:responseObject error:nil];
//        [_dataArray addObject:model.data.shareUrl];
        [self createwebView:model.data.shareUrl];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
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
