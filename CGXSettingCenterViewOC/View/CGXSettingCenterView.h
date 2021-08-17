//
//  CGXSettingCenterView.h
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXSettingCenterSectionModel.h"
#import "CGXSettingCenterSectionItemModel.h"
#import "CGXSettingCenterTools.h"
NS_ASSUME_NONNULL_BEGIN

@class CGXSettingCenterView;

@protocol CGXSettingCenterViewDelegate <NSObject>

@required

@optional

/**
 返回tableHeaderView
 @param centerView pageScrollView description
 @return tableHeaderView
 */
- (UIView *)gxSettingCenterViewHeaderView:(CGXSettingCenterView *)centerView;
/**
 返回tableHeaderView
 @param centerView pageScrollView description
 @return tableHeaderView
 */
- (UIView *)gxSettingCenterViewFooterView:(CGXSettingCenterView *)centerView;
/**
 自定义cell
 @return UITableViewCell
 item。CGXSettingCenterSectionTypeCustom 有效
 */
- (UIView *)gxSettingCenterViewCellView:(CGXSettingCenterView *)centerView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath;
/**
 自定义头分区
 */
- (UIView *)gxSettingCenterViewCellView:(CGXSettingCenterView *)centerView
                        HeaderAtInSection:(NSInteger)section;
/**
 自定义脚分区
 */
- (UIView *)gxSettingCenterViewCellView:(CGXSettingCenterView *)centerView
                        FooterAtInSection:(NSInteger)section;

/*
 点击cell
 */
- (void)gxSettingCenterView:(CGXSettingCenterView *)centerView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
                  ItemModel:(CGXSettingCenterSectionItemModel *)itemModel;

@end

@interface CGXSettingCenterView : UIView

/* 默认无*/
@property (nonatomic, assign) BOOL showsVerticalScrollIndicator;
@property (nonatomic, strong,readonly) UITableView *tableView;

@property (nonatomic, strong,readonly) NSMutableArray<CGXSettingCenterSectionModel *> *dataArray;
/*
 界面设置代理
 */
@property (nonatomic , weak) id<CGXSettingCenterViewDelegate>delegate;

- (void)updateWithDataArray:(NSMutableArray<CGXSettingCenterSectionModel *> *)dataArray;

// 更新某个item
- (void)updateWithItemModel:(CGXSettingCenterSectionItemModel *)itemModel AtIndexPath:(NSIndexPath *)indexPath;

- (void)updateWithTableHeaderView;
- (void)updateWithTableFooterView;


@end

NS_ASSUME_NONNULL_END
