//
//  ChooseContr.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/19.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "ChooseContr.h"
#import <MJRefresh/MJRefresh.h>
#import "NCModel.h"
#import "Define.h"
#import "NCCell.h"
#import "FChooseController.h"
@interface ChooseContr ()<UITableViewDataSource,UITableViewDelegate>{
  
    NSString *_urlString;
}

@end

@implementation ChooseContr

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray new];
    [self createTableView];
    [self initRequestManager];
}

- (void)initRequestManager {
    if (_manager == nil) {
        _manager = [AFHTTPRequestOperationManager manager];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        //_manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    }
}

- (void)createTableView {
    if (_appTableView == nil) {
        _appTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -49, self.view.frame.size.width, self.view.frame.size.height-49) style:UITableViewStylePlain];
        _appTableView.dataSource = self;
        _appTableView.delegate = self;
        [self.view addSubview:_appTableView];
    }
    _appTableView.tableFooterView = [UIView new];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self perpareToLoadData];
    }];
    _appTableView.mj_header = header;
    
    [_appTableView.mj_header beginRefreshing];
    
}

- (void)perpareToLoadData {
    _urlString = [NSString stringWithFormat:XChooseURL,_masterid];
  
    
    [self loadDataFormNetWithURL:_urlString];
}

- (void)loadDataFormNetWithURL:(NSString *)urlString {


    [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *array = [NSMutableArray array];
            NCModel *model = [[NCModel alloc]initWithData:responseObject error:nil];
        for (NCDataModel *dataM in model.data) {
        
            [array addObjectsFromArray:dataM.serialList];
        }

                [_dataArray addObjectsFromArray:array];
        
        [_appTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
   
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
        static NSString *identifier = @"ncell";
        NCCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[NCCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //设置选中风格
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        cell.model = _dataArray[indexPath.row];
   
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //TODO:详情页面
    FChooseController *Controller = [FChooseController new];
   
    
        NCSerialListModel *model = _dataArray[indexPath.row];
        Controller.applicationID = model.serialId;
        Controller.categoryType = self.categoryType;
        Controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:Controller animated:YES];
    
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
