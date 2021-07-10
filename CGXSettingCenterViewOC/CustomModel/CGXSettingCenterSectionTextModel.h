//
//  CGXSettingCenterSectionTextModel.h
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN


@interface CGXSettingCenterSectionTextModel : NSObject

@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,assign) UIFont *textFont;

/* 富文本 实现此上三个设置无效*/
@property (nonatomic,strong) NSMutableAttributedString *textAttring;

// 文字左右边距 默认 10
@property (nonatomic,assign) CGFloat textSpaceLeft;
@property (nonatomic,assign) CGFloat textSpaceRight;




@end

NS_ASSUME_NONNULL_END
