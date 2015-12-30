//
//  NewsController.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/16.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "NewsController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import "NewsModel.h"
#import "NewsCell.h"

@interface NewsController () 

@end

@implementation NewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // _dataArray = [NSMutableArray array];
    
    //头视图
    //_appTableView.tableHeaderView = nil;
//    NSLog(@"-------");
}

//- (void)perpareToLoadData:(BOOL)isMore {
//    NSInteger page = 1;
//    NSString *urlString = nil;
//    
//    if (isMore) {
//        if (_dataArray.count % 20 != 0 ) {
//            return ;
//        }
//        page = _dataArray.count / 20 + 1;
//    }
//    
//    urlString = [NSString stringWithFormat:self.requsetUrl,page];
//    [self loadDataFormNetWithURL:urlString isMore:isMore];
//}

//- (void)loadDataFormNetWithURL:(NSString *)urlString isMore:(BOOL)isMore {
//    NSLog(@"New--%@",urlString);
//    
//    [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NewsModel *model = [[NewsModel alloc] initWithData:responseObject error:nil];
//        if (isMore) {
//            [_dataArray addObjectsFromArray:model.data.list];
//        }else {
//            [_dataArray removeAllObjects];
//            [_appTableView reloadData];
//            _dataArray = model.data.list;
//        }
//        [_appTableView reloadData];
//        
//        isMore?[_appTableView.mj_footer endRefreshing]:[_appTableView.mj_header endRefreshing];
//    
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        isMore?[_appTableView.mj_footer endRefreshing]:[_appTableView.mj_header endRefreshing];
//    }];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return _dataArray.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifier = @"identifer";
//    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    cell.model = _dataArray[indexPath.row];
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    //TODO:详情页面
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
