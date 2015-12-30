//
//  NewCarModel.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/16.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol NewCarListModel
@end

@interface NewCarListModel : JSONModel
@property (nonatomic, copy)NSString<Optional> *newsId;
@property (nonatomic, copy)NSString<Optional> *picCover;
@property (nonatomic, copy)NSString<Optional> *filePath;
@property (nonatomic, copy)NSString<Optional> *title;
@property (nonatomic, copy)NSString<Optional> *src;
@property (nonatomic, copy)NSString<Optional> *publishTime;
@property (nonatomic, copy)NSString<Optional> *commentCount;
@property (nonatomic, copy)NSString<Optional> *viewCount;
@property (nonatomic, copy)NSString<Optional> *itemType;
@property (nonatomic, copy)NSString<Optional> *lastModify;
@property (nonatomic, copy)NSString<Optional> *dataVersion;

@end

@interface NewCarDataModel : JSONModel
@property (nonatomic, copy)NSString<Optional> *count;
@property (nonatomic, strong) NSMutableArray <NewCarListModel> *list;
@end

@interface NewCarModel : JSONModel
@property (nonatomic, copy)NSString<Optional> *status;
@property (nonatomic, copy)NSString<Optional> *message;

@property (nonatomic, strong) NewCarDataModel *data;


@end
