//
//  CGXSettingCenterTitleCell.m
//  CGXSettingCenterViewOC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterTitleCell.h"

@interface CGXSettingCenterTitleCell()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic , strong) NSLayoutConstraint *titleLabelTop;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelBottom;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelLeft;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelRight;

@end

@implementation CGXSettingCenterTitleCell
- (void)initializeViews
{
    [super initializeViews];
    self.titleLabel = ({
        UILabel *ppLabel = [[UILabel alloc]init];
        ppLabel.font = [UIFont systemFontOfSize:14];
        ppLabel.textColor = [UIColor blackColor];
        ppLabel.textAlignment = NSTextAlignmentCenter;
        ppLabel.numberOfLines = 1;
        ppLabel.layer.masksToBounds = YES;
        ppLabel.text = @"";
        ppLabel;
    });
    [self.contentView addSubview:self.titleLabel];
    [self.contentView sendSubviewToBack:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabelTop = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1.0 constant:0];
    self.titleLabelLeft = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self.contentView
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1.0 constant:0];
    self.titleLabelBottom = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.contentView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0 constant:0];
    
    self.titleLabelRight = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.contentView
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.titleLabelTop];
    [self.contentView addConstraint:self.titleLabelLeft];
    [self.contentView addConstraint:self.titleLabelBottom];
    [self.contentView addConstraint:self.titleLabelRight];
    
}
- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath
{
    [super updateCellWithSectionModel:sectionModel ItemModel:itemModel AtIndexPath:indexPath];
    self.nameLabel.hidden = YES;
    self.nameImgView.hidden = YES;
    
    self.titleLabel.text = itemModel.nameModel.text;
    self.titleLabel.font = itemModel.nameModel.textFont;
    self.titleLabel.textColor = itemModel.nameModel.textColor;
    
    NSMutableAttributedString *textAttributeStr = [CGXSettingCenterTools updatCenterModel:itemModel.nameModel];
    if (itemModel.nameModel.textAttring && itemModel.nameModel.textAttring > 0) {
        textAttributeStr = itemModel.nameModel.textAttring;
    }
    self.titleLabel.attributedText = textAttributeStr;
    
    self.titleLabelTop.constant = 0;
    self.titleLabelBottom.constant = 0;
    self.titleLabelRight.constant = -itemModel.nameModel.textSpaceRight;
    self.titleLabelLeft.constant = itemModel.nameModel.textSpaceLeft;
}

+ (CGFloat)updateCellHeightWithItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                                 MaxSize:(CGSize)maxSize
{
    NSMutableAttributedString *textAttributeStr = [CGXSettingCenterTools updatCenterModel:itemModel.nameModel];
    if (itemModel.nameModel.textAttring && itemModel.nameModel.textAttring > 0) {
        textAttributeStr = itemModel.nameModel.textAttring;
    }
    CGSize nameSize = [textAttributeStr boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading context:nil].size;
    if (nameSize.height+20> itemModel.cellHeight) {
        itemModel.cellHeight = nameSize.height+20;
    }
    return MAX(itemModel.cellHeight,44);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
