//
//  ChooseContr.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/19.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "BaseViewController.h"
#import <AFNetworking/AFNetworking.h>

@class AFHTTPRequestOperationManager;
@interface ChooseContr : BaseViewController {
    NSMutableArray *_dataArray;
    UITableView *_appTableView;
    AFHTTPRequestOperationManager *_manager;
}


@property (nonatomic, copy)NSString *requsetUrl;
@property (nonatomic, copy)NSString *categoryType;
@property (nonatomic, copy)NSString *masterid;
@end
