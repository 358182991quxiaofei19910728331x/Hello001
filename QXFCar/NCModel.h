//
//  NCModel.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/19.
//  Copyright © 2015年 屈晓飞. All rights reserved.cc
//

#import <JSONModel/JSONModel.h>

@protocol NCSerialListModel
@end

@interface NCSerialListModel : JSONModel

@property (nonatomic, copy)NSString <Optional> *serialId;
@property (nonatomic, copy)NSString <Optional> *serialName;
@property (nonatomic, copy)NSString <Optional> *Picture;
@property (nonatomic, copy)NSString <Optional> *uv;
@property (nonatomic, copy)NSString <Optional> *saleStatus;
@property (nonatomic, copy)NSString <Optional> *dealerPrice;
@end


@protocol NCDataModel

@end
@interface NCDataModel : JSONModel
@property (nonatomic, copy)NSString <Optional> *brandId;
@property (nonatomic, copy)NSString <Optional> *brandName;
@property (nonatomic, assign)BOOL foreign;
@property (nonatomic, strong) NSMutableArray <NCSerialListModel> *serialList;
@end


@interface NCModel : JSONModel
@property (nonatomic, copy)NSString <Optional> *status;
@property (nonatomic, copy)NSString <Optional> *message;

@property (nonatomic, strong) NSMutableArray <NCDataModel> *data;
@end
