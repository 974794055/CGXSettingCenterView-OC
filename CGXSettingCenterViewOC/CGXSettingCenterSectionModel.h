//
//  CGXSettingCenterSectionModel.h
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CGXSettingCenterSectionItemModel.h"
#import "CGXSettingCenterSectionTextModel.h"
NS_ASSUME_NONNULL_BEGIN


@interface CGXSettingCenterSectionModel : NSObject

@property (nonatomic,strong) CGXSettingCenterSectionTextModel *headerModel;
@property (nonatomic,strong) CGXSettingCenterSectionTextModel *footerModel;

@property (nonatomic , assign) CGFloat headerHeight;
@property (nonatomic , strong) UIColor *headerBgColor;

@property (nonatomic , strong) UIColor *footerBgColor;
@property (nonatomic , assign) CGFloat footerHeight;


@property (nonatomic,strong) NSMutableArray<CGXSettingCenterSectionItemModel *> *rowArray;

// 处理自定义的数据源
@property (nonatomic , strong) id dataModel;

@end

NS_ASSUME_NONNULL_END
