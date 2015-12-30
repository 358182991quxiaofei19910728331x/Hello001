//
//  KuTuModel.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/16.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol KuTuDataModel
@end

@interface KuTuDataModel : JSONModel
@property (nonatomic, copy)NSString<Optional> *newsId;
@property (nonatomic, copy)NSString<Optional> *picCover;
@property (nonatomic, copy)NSString<Optional> *filePath;
@property (nonatomic, copy)NSString<Optional> *title;
@property (nonatomic, copy)NSString<Optional> *src;
@property (nonatomic, copy)NSString<Optional> *publishTime;
@property (nonatomic, copy)NSString<Optional> *commentCount;
@property (nonatomic, copy)NSString<Optional> *itemType;
@property (nonatomic, copy)NSString<Optional> *lastModify;
@property (nonatomic, copy)NSString<Optional> *dataVersion;
@property (nonatomic, copy)NSString<Optional> *imageCount;
@end

@interface KuTuModel : JSONModel
@property (nonatomic, copy)NSString<Optional> *status;
@property (nonatomic, copy)NSString<Optional> *message;

@property (nonatomic, strong) NSMutableArray <KuTuDataModel>*data;
@end
