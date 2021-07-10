//
//  CGXSettingCenterBaseCell.h
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXSettingCenterTools.h"
#import "CGXSettingCenterSectionModel.h"
#import "CGXSettingCenterSectionItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CGXSettingCenterCellDelegate <NSObject>
@required
@optional
/*
 sectionmodel:分区model
 itemModel   ：每个model
 section。   ：所在分区
 */
- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CGXSettingCenterBaseCell : UITableViewCell<CGXSettingCenterCellDelegate>

@property (nonatomic,strong,readonly) CGXSettingCenterSectionModel *sectionmodel;
@property (nonatomic,strong,readonly) CGXSettingCenterSectionItemModel *itemModel;
@property (nonatomic,assign,readonly) NSIndexPath *indexPath;

@property (nonatomic,strong,readonly) UILabel *nameLabel;//左侧功能名称
@property (nonatomic,strong,readonly) UIImageView *nameImgView;//左侧功能图片

- (void)initializeViews NS_REQUIRES_SUPER;

- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath NS_REQUIRES_SUPER;


@end

NS_ASSUME_NONNULL_END
