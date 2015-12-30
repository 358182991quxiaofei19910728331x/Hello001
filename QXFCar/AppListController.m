//
//  AppListController.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/15.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "AppListController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import "Define.h"
#import "NewCarModel.h"
#import "NewsModel.h"
#import "KuTuModel.h"
#import "UIView+Common.h"
#import "AppCell.h"
#import "KuTuCell.h"
#import "NewsCell.h"
#import "ChooeseModel.h"
#import "ChooeseCell.h"
#import "NewsCarModel.h"
#import "NewsCarCell.h"
#import "SalesModel.h"
#import "SalesCell.h"
#import "HomesControllers.h"
#import "ChooseContr.h"
#import "KuTu.h"
#import "SalesDetailController.h"

@interface AppListController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation AppListController

- (void)viewDidLoad {
    [super viewDidLoad];
    _categoryID = @"0";
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"backImage"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
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
        _appTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49- 50-44) style:UITableViewStylePlain];
        _appTableView.dataSource = self;
        _appTableView.delegate = self;
        [self.view addSubview:_appTableView];
    }
    
    _appTableView.tableFooterView = [UIView new];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self perpareToLoadData:NO];
    }];
    _appTableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self perpareToLoadData:YES];
    }];

    _appTableView.mj_footer = footer;
    [_appTableView.mj_header beginRefreshing];
}


- (void)perpareToLoadData:(BOOL)isMore {
    NSInteger page = 1;
    NSString *urlString = nil;
    if (isMore) {
        if (_dataArray.count % 20 != 0 ) {
            return ;
        }
        page = _dataArray.count/20 + 1;
    }
    
  //  urlString = [NSString stringWithFormat:_requsetUrl,page];
    if ([_categoryType isEqualToString:QHome1Type] || [_categoryType isEqualToString:QHome2Type] || [_categoryType isEqualToString:QHome3Type] || [_categoryType isEqualToString:QHome4Type] || [_categoryType isEqualToString:QHome5Type] || [_categoryType isEqualToString:QSales1Type] || [_categoryType isEqualToString:QSales2Type] || [_categoryType isEqualToString:QSales3Type] || [_categoryType isEqualToString:QSales4Type] || [_categoryType isEqualToString:QSales5Type]) {
        urlString = [NSString stringWithFormat:_requsetUrl,page];
    }else if ([_categoryType isEqualToString:KChooseType] || [_categoryType isEqualToString:KNewCarType]){
        urlString = _requsetUrl;
    
    }
    
    [self loadDataFormNetWithURL:urlString isMore:isMore];
}


- (void)loadDataFormNetWithURL:(NSString *)urlString isMore:(BOOL)isMore {
    NSLog(@"---%@",urlString);
   
    [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([_categoryType isEqualToString:QHome1Type] || [_categoryType isEqualToString:QHome2Type] || [_categoryType isEqualToString:QHome4Type] || [_categoryType isEqualToString:QHome5Type]) {
            NewCarModel *model = [[NewCarModel alloc]initWithData:responseObject error:nil];
            if (isMore) {
                [_dataArray addObjectsFromArray:model.data.list];
            }else {
                [_dataArray removeAllObjects];
                [_appTableView reloadData];
                _dataArray = model.data.list;
            }

        }
        if ([_categoryType isEqualToString:QHome3Type]) {
            KuTuModel *model = [[KuTuModel alloc]initWithData:responseObject error:nil];
            if (isMore) {
                [_dataArray addObjectsFromArray:model.data];
            }else {
                
                [_dataArray removeAllObjects];
                [_appTableView reloadData];
                _dataArray = model.data;
            }
        }
        if ([_categoryType isEqualToString:KChooseType]) {
            ChooeseModel *model = [[ChooeseModel alloc]initWithData:responseObject error:nil];
            if (isMore) {
                [_dataArray addObjectsFromArray:model.data];
            }else {
                
                [_dataArray removeAllObjects];
                [_appTableView reloadData];
                _dataArray = model.data;
            }
        }
        if ([_categoryType isEqualToString:KNewCarType]) {
            NewsCarModel *model = [[NewsCarModel alloc]initWithData:responseObject error:nil];
            if (isMore) {
                [_dataArray addObjectsFromArray:model.data];
            }else {
                
                [_dataArray removeAllObjects];
                [_appTableView reloadData];
                _dataArray = model.data;
            }
        }
        if ([_categoryType isEqualToString:QSales1Type] || [_categoryType isEqualToString:QSales2Type] || [_categoryType isEqualToString:QSales3Type] || [_categoryType isEqualToString:QSales4Type] || [_categoryType isEqualToString:QSales5Type]) {
            SalesModel *model = [[SalesModel alloc]initWithData:responseObject error:nil];
            if (isMore) {
                [_dataArray addObjectsFromArray:model.data.list];
            }else {
                
                [_dataArray removeAllObjects];
                [_appTableView reloadData];
                _dataArray = model.data.list;
            }
            
        }
               [_appTableView reloadData];
    
       isMore?[_appTableView.mj_footer endRefreshing]:[_appTableView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"##########");
        isMore?[_appTableView.mj_footer endRefreshing]:[_appTableView.mj_header endRefreshing];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_categoryType isEqualToString:QHome1Type] || [_categoryType isEqualToString:QHome2Type] || [_categoryType isEqualToString:QHome4Type] || [_categoryType isEqualToString:QHome5Type]) {
        return 100;
    }
    if ([_categoryType isEqualToString:QHome3Type]) {
        return 225;
    }
    if ([_categoryType isEqualToString:KChooseType]) {
        return 80;
    }
    if ([_categoryType isEqualToString:KNewCarType]) {
        return 60;
    }
    if ([_categoryType isEqualToString:QSales1Type] || [_categoryType isEqualToString:QSales2Type] || [_categoryType isEqualToString:QSales3Type] || [_categoryType isEqualToString:QSales4Type] || [_categoryType isEqualToString:QSales5Type]) {
        return 100;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_categoryType isEqualToString:QHome3Type]) {
        static NSString *identifier = @"KuTu";
        KuTuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[KuTuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //设置选中风格
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景底"]];
        cell.backgroundView.frame = cell.frame;
        cell.model = _dataArray[indexPath.row];
        return cell;
        
    }else if ([_categoryType isEqualToString:KChooseType]){
        static NSString *identifier = @"Choose";
        ChooeseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[ChooeseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //设置选中风格
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景底"]];
        cell.backgroundView.frame = cell.frame;
        cell.model = _dataArray[indexPath.row];
        return cell;
    }else if ([_categoryType isEqualToString:KNewCarType]){
        static NSString *identifier = @"newsCar";
        NewsCarCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[NewsCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //设置选中风格
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景底"]];
        cell.backgroundView.frame = cell.frame;
        cell.model = _dataArray[indexPath.row];
        return cell;
    }else if ([_categoryType isEqualToString:QSales1Type] || [_categoryType isEqualToString:QSales2Type] || [_categoryType isEqualToString:QSales3Type] || [_categoryType isEqualToString:QSales4Type] || [_categoryType isEqualToString:QSales5Type]) {
        static NSString *identifier = @"newsCar";
        SalesCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[SalesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //设置选中风格
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景底"]];
        cell.backgroundView.frame = cell.frame;
        cell.model = _dataArray[indexPath.row];
        return cell;
        
    }else {
    static NSString *identifier = @"identifer";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[AppCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //设置选中风格
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景底"]];
        cell.backgroundView.frame = cell.frame;
    cell.model = _dataArray[indexPath.row];
        
        
    return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    //TODO:详情页面
    HomesControllers *detailController = [HomesControllers new];
    if ([_categoryType isEqualToString:QHome1Type] || [_categoryType isEqualToString:QHome2Type] || [_categoryType isEqualToString:QHome4Type] || [_categoryType isEqualToString:QHome5Type] || [_categoryType isEqualToString:KNewCarType]) {
        NewCarListModel *model = _dataArray[indexPath.row];
        detailController.applicationID = model.newsId;
        detailController.lastmodify = model.lastModify;
        detailController.categoryType = self.categoryType;
        detailController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailController animated:YES];
    }
    if ([_categoryType isEqualToString:KNewCarType]) {
        NewsCarDataModel *model = _dataArray[indexPath.row];
        detailController.applicationID = model.CSId;
        detailController.categoryType = self.categoryType;
        detailController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailController animated:YES];
    }
    if ([_categoryType isEqualToString:QHome3Type]) {
        KuTuDataModel *model = _dataArray[indexPath.row];
        KuTu *controller = [KuTu new];
        controller.applicationID = model.newsId;
        controller.lastmodify = model.lastModify;
        controller.categoryType = self.categoryType;
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
    }
    if ([_categoryType isEqualToString:KChooseType]) {
        ChooeseDataModel *model = _dataArray[indexPath.row];
        ChooseContr *controller = [ChooseContr new];
        controller.masterid = model.masterId;
        controller.categoryType = self.categoryType;
        detailController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
    }
    if ([_categoryType isEqualToString:QSales1Type] || [_categoryType isEqualToString:QSales2Type]|| [_categoryType isEqualToString:QSales3Type]|| [_categoryType isEqualToString:QSales4Type]|| [_categoryType isEqualToString:QSales5Type]) {
        SalesListModel *model = _dataArray[indexPath.row];
        SalesDetailController *controller = [SalesDetailController new];
        controller.applicationID = model.SerialId;
        controller.categoryType = self.categoryType;
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
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
