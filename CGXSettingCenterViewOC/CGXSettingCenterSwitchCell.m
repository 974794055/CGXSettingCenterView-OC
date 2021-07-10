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

@end
@implementation CGXSettingCenterSwitchCell
- (void)initializeViews
{
    [super initializeViews];
    self.aSwitch = [[UISwitch alloc] init];
    [self.contentView addSubview:self.aSwitch];
    self.aSwitch.layer.masksToBounds = YES;
    [self.aSwitch addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    self.aSwitch.userInteractionEnabled = YES;
    self.aSwitch.transform = CGAffineTransformMakeScale(1, 1);
}
- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath
{
    [super updateCellWithSectionModel:sectionModel ItemModel:itemModel AtIndexPath:indexPath];
    NSLog(@"11---%f",self.aSwitch.frame.size.width);

    [self.aSwitch setOn:itemModel.switchOpen animated:YES];
   
    __weak typeof(self) weakSelf = self;
    if (itemModel.switchBlock) {
        itemModel.switchBlock(weakSelf.aSwitch);
    }
    self.aSwitch.center = CGPointMake(CGRectGetWidth(self.contentView.bounds)-itemModel.spacenameRight-CGRectGetWidth(self.aSwitch.frame)/2.0, self.contentView.center.y);
    NSLog(@"22---%f",self.aSwitch.frame.size.width);
}
- (void)switchChange:(UISwitch*)sw {
    if (self.switchValueChanged) {
        self.switchValueChanged(sw.on, self.itemModel);
    }
}

@end
