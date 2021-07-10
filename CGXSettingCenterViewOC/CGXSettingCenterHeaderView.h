//
//  CGXSettingCenterHeaderView.h
//  CGXSettingCenterViewOC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXSettingCenterSectionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXSettingCenterHeaderView : UITableViewHeaderFooterView
@property (nonatomic , strong,readonly) UILabel *titleLabel;

/*
 sectionmodel:分区model
 section。   ：所在分区
 */
- (void)updateHeaderViewWithSectionModel:(CGXSettingCenterSectionModel *)sectionmodel
                         AtInSection:(NSInteger)section;
@end

NS_ASSUME_NONNULL_END
