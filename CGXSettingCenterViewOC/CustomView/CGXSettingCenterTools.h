//
//  CGXSettingCenterTools.h
//  CGXSettingCenterViewOC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGXSettingCenterSectionTextModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXSettingCenterTools : NSObject
+ (CGSize)sizeForTextView:(CGSize)constraint WithText:(NSString *) strText WithFont:(UIFont *)font;

// 巨左显示
+ (NSMutableAttributedString *)updateTextLeftModel:(CGXSettingCenterSectionTextModel *)nameModel;
//居右显示
+ (NSMutableAttributedString *)updateTextRightModel:(CGXSettingCenterSectionTextModel *)detailsModel;
//居中间显示
+ (NSMutableAttributedString *)updatCenterModel:(CGXSettingCenterSectionTextModel *)detailsModel;
/*
 自定义view生成富文本
 */
+ (NSMutableAttributedString *)updateConvertViewToAttributed:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
