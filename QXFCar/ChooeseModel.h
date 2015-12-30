//
//  ChooeseModel.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/17.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ChooeseDataModel

@end

@interface ChooeseDataModel : JSONModel
@property (nonatomic, copy)NSString <Optional> *masterId;
@property (nonatomic, copy)NSString <Optional> *name;
@property (nonatomic, copy)NSString <Optional> *logoUrl;
@property (nonatomic, copy)NSString <Optional> *initial;
@property (nonatomic, copy)NSString <Optional> *Price;
@property (nonatomic, copy)NSString <Optional> *uv;
@property (nonatomic, copy)NSString <Optional> *saleStatus;
@end

@interface ChooeseModel : JSONModel
@property (nonatomic, copy)NSString <Optional> *status;
@property (nonatomic, copy)NSString <Optional> *message;
@property (nonatomic, strong) NSMutableArray <ChooeseDataModel> *data;

@end
