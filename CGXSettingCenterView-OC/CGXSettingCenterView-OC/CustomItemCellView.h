//
//  CustomItemCellView.h
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

@interface CustomItemCellView : UIView
- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
