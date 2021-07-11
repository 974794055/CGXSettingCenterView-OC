//
//  CGXSettingCenterSwitchCell.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterSwitchCell.h"
@interface CGXSettingCenterSwitchCell()

@property (nonatomic, strong) UISwitch *aSwitch;
@property (nonatomic, strong) UIButton *btn;
@end
@implementation CGXSettingCenterSwitchCell
- (void)initializeViews
{
    [super initializeViews];
    self.aSwitch = [[UISwitch alloc] init];
    [self.contentView addSubview:self.aSwitch];
//    [self.aSwitch addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    self.aSwitch.userInteractionEnabled = YES;
    self.aSwitch.transform = CGAffineTransformMakeScale(1, 1);
    self.aSwitch.center = CGPointMake(self.contentView.center.x, self.contentView.center.y);
    
    self.btn= ({
        UIButton *ppBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [ppBtn addTarget:self action:@selector(switchChangcce:) forControlEvents:UIControlEventTouchUpInside];
        ppBtn;
    });
    [self.contentView addSubview:self.btn];
    // UISwitch 在项目有时会触发不了事件 加上btn代替
}
- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath
{
    [super updateCellWithSectionModel:sectionModel ItemModel:itemModel AtIndexPath:indexPath];
    [self.aSwitch setOn:itemModel.switchOpen animated:YES];
    __weak typeof(self) weakSelf = self;
    if (itemModel.switchBlock) {
        itemModel.switchBlock(weakSelf.aSwitch);
    }
    self.aSwitch.center = CGPointMake(CGRectGetWidth(self.contentView.bounds)-itemModel.spacenameRight-CGRectGetWidth(self.aSwitch.frame)/2.0, self.contentView.center.y);
    self.btn.frame  =self.aSwitch.frame;
}
//- (void)switchChange:(UISwitch*)sw {
//    if (self.switchValueChanged) {
//        self.switchValueChanged(sw.on, self.itemModel);
//    }
//}
- (void)switchChangcce:(UIButton *)btn {
    self.aSwitch.on = !self.aSwitch.on;
    if (self.switchValueChanged) {
        self.switchValueChanged(self.aSwitch.on, self.itemModel);
    }
}
@end
