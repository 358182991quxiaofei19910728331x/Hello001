//
//  NewsCarModel.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/18.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol NewsCarDataModel

@end
@interface NewsCarDataModel : JSONModel
@property (nonatomic, copy)NSString <Optional> *CSId;
@property (nonatomic, copy)NSString <Optional> *MasterBrandId;
@property (nonatomic, copy)NSString <Optional> *ShowName;
@property (nonatomic, copy)NSString <Optional> *Img;
@property (nonatomic, copy)NSString <Optional> *Price;
@property (nonatomic, copy)NSString <Optional> *Level;
@property (nonatomic, copy)NSString <Optional> *AllSpell;
@end


@interface NewsCarModel : JSONModel

@property (nonatomic, assign)BOOL success;

@property (nonatomic, strong) NSMutableArray <NewsCarDataModel> *data;

@end
