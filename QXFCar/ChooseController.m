//
//  ChooseController.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/15.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "ChooseController.h"
#import "AppListController.h"
#import "Define.h"
@interface ChooseController ()

@end

@implementation ChooseController

- (void)viewDidLoad {
    [super viewDidLoad];

    _appTableView.bounds = CGRectMake(0, 96, SCREEN_WIDTH, SCREEN_HEIGHT-36-49-30);
      [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"backImage"] forBarMetrics:UIBarMetricsDefault];

    

}



//
//- (void)perpareToLoadData:(BOOL)isMore {
//    
//    NSString *urlString =self.requsetUrl;
//
//    [self loadDataFormNetWithURL:urlString isMore:isMore];
//}
//
//- (void)loadDataFormNetWithURL:(NSString *)urlString isMore:(BOOL)isMore {
//    
//    NSLog(@"root------%@",urlString);
//    [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        ChooeseModel *model = [[ChooeseModel alloc]initWithData:responseObject error:nil];
//        if (isMore) {
//            [_dataArray addObjectsFromArray:model.data];
//        }else {
//            
//            [_dataArray removeAllObjects];
//            [_appTableView reloadData];
//            _dataArray = model.data;
//        }
//        [_appTableView reloadData];
//        
//        isMore?[_appTableView.mj_footer endRefreshing]:[_appTableView.mj_header endRefreshing];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"##########");
//        isMore?[_appTableView.mj_footer endRefreshing]:[_appTableView.mj_header endRefreshing];
//    }];
//}
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 60;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return _dataArray.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//  
//    static NSString *identifier = @"Chooese";
//    ChooeseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[ChooeseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//            //设置选中风格
//            // cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        }
//    cell.model = _dataArray[indexPath.row];
//    return cell;
//    
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    //TODO:详情页面
//    
//    
//    
//    
//}

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
