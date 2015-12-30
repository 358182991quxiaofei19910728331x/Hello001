//
//  MySetController.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/21.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "MySetController.h"

@interface MySetController ()

@end

@implementation MySetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLabel];
    
   // [self createSet];
}

- (void)createLabel {
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景底"]];
    imageView.frame =self.view.frame;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 64, self.view.frame.size.width - 40, self.view.frame.size.height- 64 - 49)];
    label.text = @"【专业新闻】新车、汽车评测、汽车导购、车展、热点汽车新闻，通俗易懂、专业及时;\n\n【精准选车】全方位选车条件，助你快速选定爱车,全面的车型报价\n\n是一款汽车查询软件,对于有意向购车的伙伴真的很实用,每天都可以跟自己喜欢的车型零距离接触,了解车型外观,车型颜色,车型参数及配置,总之,这里就是汽车大市场!\n\n汽车门户为您提供汽车行业的行业动态、国产新车、进口新车等资讯知识,以及向广大用户展示豪华车、跑车、SUV、MPV以及各种车型，该客户端面向全国招商，各大企业可在该客户端上发布供求信息，让各大企业以及广大客户更为便捷。汽车门户以便捷的浏览方式、强大的应用功能,为广大客户提供了一个丰富的汽车门户行业信息平台";
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 0;
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textColor = [UIColor grayColor];
    
    [imageView addSubview:label];
    [self.view addSubview:imageView];
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
