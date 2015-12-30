//
//  AppListController.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/15.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "BaseViewController.h"

@class AFHTTPRequestOperationManager;

@interface AppListController : BaseViewController {
    NSMutableArray *_dataArray;
    UITableView *_appTableView;
    AFHTTPRequestOperationManager *_manager;
}

@property (nonatomic, copy)NSString *categoryID;
@property (nonatomic, copy)NSString *requsetUrl;
@property (nonatomic, copy)NSString *categoryType;

- (void)loadDataFormNetWithURL:(NSString *)urlString isMore:(BOOL)isMore;

- (void)perpareToLoadData:(BOOL)isMore;

@end
