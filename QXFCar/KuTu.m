//
//  KuTu.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/21.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "KuTu.h"
#import "Define.h"
#import <AFNetworking/AFNetworking.h>
#import "KuTuDetailModel.h"
#import <UIImageView+WebCache.h>
#import "UIView+Common.h"
@interface KuTu ()<UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    NSString *_urlString;
    NSMutableArray *_dataArray;
     NSMutableArray *_albumsArray;
    UILabel *_title;
    UITextView *_des;
    KuTuDetailModel *_model;
}

@end

@implementation KuTu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray = [[NSMutableArray alloc] init];
    _albumsArray = [NSMutableArray new];
    _urlString = [NSString stringWithFormat:XHome2URL,_applicationID,_lastmodify];
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    
    [self NetManager];
}

- (void)createScrollView {
    _scrollView = [[UIScrollView alloc] init];
    
    _scrollView.frame = CGRectMake(0,64, self.view.frame.size.width,self.view.frame.size.height- 64-49);
    _scrollView.backgroundColor = [UIColor colorWithRed:10/255.f green:-70/255.f blue:-80/255.f alpha:1];
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    
    [self.view addSubview:_scrollView];
}

- (void)NetManager {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:_urlString parameters:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
        _model = [[KuTuDetailModel alloc]initWithData:responseObject error:nil];
        [self createScrollView];
        [self createScrollImages];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)createScrollImages {
    NSInteger imageCount = 0;
    CGSize size = _scrollView.frame.size;
    
    
    _title = [[UILabel alloc]init];
    _title.backgroundColor = [UIColor clearColor];
    _title.text = _model.data.title;
    _title.numberOfLines = 0;
    _title.textColor =[UIColor whiteColor];
    _title.font = [UIFont boldSystemFontOfSize:20];
    
    for (KuTuAlbumsDetailModel *albums in _model.data.albums) {
        UIImageView *imageView= [[UIImageView alloc]init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:albums.imageUrl] placeholderImage:nil];
        imageView.frame = CGRectMake(size.width*imageCount, 64, size.width, size.height-250);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        _des = [[UITextView alloc]init];
        _des.text = albums.content;
        _des.font = [UIFont boldSystemFontOfSize:15];
        _des.backgroundColor = [UIColor clearColor];
        _des.frame = CGRectMake(20, maxY(imageView) - 50, self.view.frame.size.width - 40, 200);
        _des.textColor = [UIColor whiteColor];
        _title.frame = CGRectMake(20,20, self.view.frame.size.width - 40, 50);
        
        [imageView addSubview:_title];
        [imageView addSubview:_des];
        [_scrollView addSubview:imageView];
        
        imageCount++;
        
        
    }
    _scrollView.contentSize = CGSizeMake(size.width*imageCount, size.height);
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
