//
//  CGXSettingCenterTextCell.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterTextCell.h"
@interface CGXSettingCenterTextCell()

@property (nonatomic, strong) UILabel *detailsLabel;//左侧功能图片

@property (nonatomic , strong) NSLayoutConstraint *detailsTop;
@property (nonatomic , strong) NSLayoutConstraint *detailsBottom;
@property (nonatomic , strong) NSLayoutConstraint *detailsLeft;
@property (nonatomic , strong) NSLayoutConstraint *detailsRight;
@end
@implementation CGXSettingCenterTextCell

- (void)initializeViews
{
    [super initializeViews];
    self.detailsLabel = ({
        UILabel *ppLabel = [[UILabel alloc]init];
        ppLabel.font = [UIFont systemFontOfSize:14];
        ppLabel.textColor = [UIColor blackColor];
        ppLabel.textAlignment = NSTextAlignmentRight;
        ppLabel.numberOfLines = 1;
        ppLabel.layer.masksToBounds = YES;
        ppLabel.text = @"";
        ppLabel;
    });
    [self.contentView addSubview:self.detailsLabel];
    
    self.detailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.detailsTop = [NSLayoutConstraint constraintWithItem:self.detailsLabel
                                                   attribute:NSLayoutAttributeTop
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self.contentView
                                                   attribute:NSLayoutAttributeTop
                                                  multiplier:1.0 constant:0];
    self.detailsBottom = [NSLayoutConstraint constraintWithItem:self.detailsLabel
                                                      attribute:NSLayoutAttributeBottom
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeBottom
                                                     multiplier:1.0 constant:0];
    
    self.detailsRight = [NSLayoutConstraint constraintWithItem:self.detailsLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0 constant:0];
    self.detailsLeft = [NSLayoutConstraint constraintWithItem:self.detailsLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.nameLabel
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0 constant:0];
    
    [self.contentView addConstraint:self.detailsTop];
    [self.contentView addConstraint:self.detailsBottom];
    [self.contentView addConstraint:self.detailsRight];
    [self.contentView addConstraint:self.detailsLeft];
        
}
- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath
{
    [super updateCellWithSectionModel:sectionModel ItemModel:itemModel AtIndexPath:indexPath];
    
    self.detailsLabel.text = itemModel.detailModel.text;
    self.detailsLabel.font = itemModel.detailModel.textFont;
    self.detailsLabel.textColor = itemModel.detailModel.textColor;
    self.detailsLabel.textAlignment = NSTextAlignmentRight;
 
    NSMutableAttributedString *textAttributeStr = [CGXSettingCenterTools updateTextRightModel:itemModel.detailModel];
    if (itemModel.detailModel.textAttring && itemModel.detailModel.textAttring > 0) {
        textAttributeStr = itemModel.detailModel.textAttring;
    }
    self.detailsLabel.attributedText = textAttributeStr;

    self.detailsTop.constant = 0;
    self.detailsBottom.constant = 0;
    self.detailsLeft.constant = 10;
    
    if (itemModel.arrowImage) {
        self.detailsRight.constant = -itemModel.spacenameRight-itemModel.arrowSize.width-itemModel.spaceArrowRight;
    } else{
        self.detailsRight.constant = -itemModel.spacenameRight;
    }
}

@end
