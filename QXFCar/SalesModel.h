//
//  SalesModel.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/18.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol SalesListModel
@end

@interface SalesListModel : JSONModel
@property (nonatomic, copy)NSString <Optional> *SerialId;
@property (nonatomic, copy)NSString <Optional> *SerialName;
@property (nonatomic, copy)NSString <Optional> *ItemUrl;
@property (nonatomic, copy)NSString <Optional> *Index;
@property (nonatomic, copy)NSString <Optional> *Rank;
@property (nonatomic, copy)NSString <Optional> *GrowthRate;
@property (nonatomic, copy)NSString <Optional> *RankGrowth;
@property (nonatomic, copy)NSString <Optional> *MinPrice;
@property (nonatomic, copy)NSString <Optional> *MaxPrice;
@property (nonatomic, copy)NSString <Optional> *WhiteCoverImg;

@end

@interface SalesDataModel : JSONModel
@property (nonatomic, copy)NSString <Optional> *count;
@property (nonatomic, strong) NSMutableArray <SalesListModel> *list;

@end


@interface SalesModel : JSONModel
@property (nonatomic, copy)NSString <Optional> *status;
@property (nonatomic, copy)NSString <Optional> *message;
@property (nonatomic, strong)SalesDataModel *data;
@end
