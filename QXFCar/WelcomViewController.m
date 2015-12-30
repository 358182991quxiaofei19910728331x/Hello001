//
//  WelcomViewController.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/15.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "WelcomViewController.h"

#import "TabBarController.h"

#import "UIView+Common.h"

@interface WelcomViewController ()<UIScrollViewDelegate> {
    UIScrollView *_scrollView;
}

@end

@implementation WelcomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWelcomPages];
}

- (void)createWelcomPages {
    _scrollView= [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    for (int i = 1; i <= 4 ; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake((i - 1) * screenWidth(), 0, screenWidth(), screenHeight());
        if (i == 4) {
            imageView.userInteractionEnabled  = YES;
        }
        [_scrollView addSubview:imageView];
    }
    _scrollView.bounces = NO;
    _scrollView.contentSize = CGSizeMake(screenWidth() * 4, screenHeight());
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x == screenWidth()*3) {
        TabBarController *tabbarController = [[TabBarController alloc]init];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = tabbarController;
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
