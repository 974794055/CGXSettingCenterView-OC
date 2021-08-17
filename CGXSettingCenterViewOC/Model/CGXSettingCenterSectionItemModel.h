//
//  CGXSettingCenterSectionItemModel.h
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CGXSettingCenterSectionTextModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    CGXSettingCenterSectionTypeNode,       // 空白            UITableViewCell
    CGXSettingCenterSectionTypeHeader,     // 头像            CGXSettingCenterImageCell
    CGXSettingCenterSectionTypeSwitch,     // 开关            CGXSettingCenterSwitchCell
    CGXSettingCenterSectionTypeText,       // 文字            CGXSettingCenterTextCell
    CGXSettingCenterSectionTypeTitle,       // 只有文字居中     CGXSettingCenterTitleCell
    CGXSettingCenterSectionTypeCustom,// 自定义cell

} CGXSettingCenterSectionType;

@interface CGXSettingCenterSectionItemModel : NSObject

/*初始化方法*/
- (instancetype)initWithSectionType:(CGXSettingCenterSectionType)sectionType;
/* item类型*/
@property(nonatomic,assign,readonly) CGXSettingCenterSectionType sectionType;

@property(nonatomic,strong,readonly) Class cellClass;
//cell的标识符
@property(nonatomic,strong,readonly) NSString *cellIdentifier;
// cell的颜色 默认白色
@property(nonatomic,strong) UIColor *cellColor;
// cell的颜色 默认白色
@property(nonatomic,assign) CGFloat cellHeight;

//cell的原始数据
@property(nonatomic,strong) id dataModel;

// 是否隐藏cell 默认NO
@property(nonatomic,assign) BOOL isHiddenCell;
// 是否有下划线
@property(nonatomic,assign) BOOL isLine;
@property(nonatomic,strong) UIColor  *lineViewColor;
// 左侧边距
@property(nonatomic,assign) CGFloat  spacelineLeft;
// 右侧边距
@property(nonatomic,assign) CGFloat  spacelineRight;

/**< 功能文字  */
@property(nonatomic,strong) CGXSettingCenterSectionTextModel *nameModel;

// 默认最大三分之二 根据需求设置 0.1~0.9之间 不要乱设置 两端无效
@property(nonatomic,assign) CGFloat  nameMacWidth;

/**< 功能图片  */
@property(nonatomic,strong) UIImage *nameImage;
@property(nonatomic,assign) CGSize  nameImageSize;
// 左图文间距
@property(nonatomic,assign) CGFloat  spaceNameImage;
// 左侧边距
@property(nonatomic,assign) CGFloat  spacenameLeft;
// 右侧边距
@property(nonatomic,assign) CGFloat  spacenameRight;

/**< 右侧箭头图片  */
@property(nonatomic,strong) UIImage *arrowImage;
@property(nonatomic,assign) CGSize  arrowSize;
// 右图文间距
@property(nonatomic,assign) CGFloat  spaceArrowLeft;
@property(nonatomic,assign) CGFloat  spaceArrowRight;

/**< 详情文字  */
@property(nonatomic,strong) CGXSettingCenterSectionTextModel *detailModel;

/**<头像图片  */
@property(nonatomic,strong) UIImage *headerImage;
@property(nonatomic,strong) NSURL *headerUrl;
/**<头像图片上下间距 默认10  */
@property(nonatomic,assign) CGSize  headerSize;

@property (nonatomic, copy) void(^loadImageBlock)(UIImageView *headerImageView,NSURL *headerUrl);


@property(nonatomic,assign) BOOL switchOpen; // 是否打开
//配置开关基础
@property (nonatomic, copy) void(^switchBlock)(UISwitch *itemSwitch);


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
