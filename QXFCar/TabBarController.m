//
//  TabBarController.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/15.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "TabBarController.h"

#import "SalesController.h"

#import "AppDelegate.h"

#import "Define.h"

#import "UIView+Common.h"

#import "HomeController.h"

#import "AppListController.h"
#import "MySetController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSplashView];
    
    [self creatTabBarimage];
    [self createViewControllers];
  
    
}



- (void)creatTabBarimage {
    UIImage *image = [UIImage imageNamed:@"tabbar01"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth(self.view), screenHeight(self.tabBar))];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [self.tabBar insertSubview:imageView atIndex:1];
}

- (void)createViewControllers {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"controllers" ofType:@"plist"];
    NSArray *vcArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    //创建存放控制器的数组
    NSMutableArray *controllers = [NSMutableArray new];
  
    for (NSDictionary *dict in vcArray) {
 
        id controller = nil;
        if ([dict[@"className"] isEqualToString:@"HomeController" ]) {
            controller = [[HomeController alloc] init];
        }else if ([dict[@"className"] isEqualToString:@"SalesController"]){
            controller = [[SalesController alloc] init];
        }else if([dict[@"className"] isEqualToString:@"ChooseController"]) {
            controller = [[AppListController alloc]init];
            [controller setRequsetUrl:QChooseURL];
            [controller setCategoryType:KChooseType];
        }else if ([dict[@"className"] isEqualToString:@"MySetController"]) {
            controller = [[MySetController alloc]init];
        }
//        else if ([dict[@"className"] isEqualToString:@"NewCarController"]) {
//            controller = [[AppListController alloc]init];
//            [controller setRequsetUrl:QNewCarURL];
//            [controller setCategoryType:KNewCarType];
//        }
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
        [controller setTitle:dict[@"title"]];
        
        
        
        //设置tabbaritem 的字体位置 和大小
        [nav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -16)];
        [nav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]} forState:UIControlStateNormal];
        
        [controllers addObject:nav];
    }
    self.viewControllers = controllers;
}

- (void)createSplashView {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth(), screenHeight())];
    NSString *splashPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",4] ofType:@"jpg"];
    imageView.image = [[UIImage alloc] initWithContentsOfFile:splashPath];
    [self.view addSubview:imageView];
    [UIView animateWithDuration:3 animations:^{
        imageView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
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
