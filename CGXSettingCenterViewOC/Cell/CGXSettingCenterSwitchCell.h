//
//  CGXSettingCenterSwitchCell.h
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterBaseCell.h"

NS_ASSUME_NONNULL_BEGIN


@interface CGXSettingCenterSwitchCell : CGXSettingCenterBaseCell

@property (nonatomic,copy) void (^switchValueChanged)(BOOL isOn,CGXSettingCenterSectionItemModel *itemM); /**<  XBSettingAccessoryTypeSwitch下开关变化 */

@end

NS_ASSUME_NONNULL_END
