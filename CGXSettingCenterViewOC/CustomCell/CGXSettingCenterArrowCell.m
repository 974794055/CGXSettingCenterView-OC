//
//  CGXSettingCenterArrowCell.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterArrowCell.h"

@interface CGXSettingCenterArrowCell()

@property (nonatomic, strong) UIImageView *arrowImageView;//左侧功能图片

@property (nonatomic , strong) NSLayoutConstraint *arrowImageY;
@property (nonatomic , strong) NSLayoutConstraint *arrowImageRight;
@property (nonatomic , strong) NSLayoutConstraint *arrowImageWidth;
@property (nonatomic , strong) NSLayoutConstraint *arrowImageheight;
@end
@implementation CGXSettingCenterArrowCell

- (void)initializeViews
{
    [super initializeViews];
    self.arrowImageView = ({
        UIImageView *ppImageView = [[UIImageView alloc] init];
        ppImageView.contentMode = UIViewContentModeScaleAspectFit;
        ppImageView.layer.masksToBounds = YES;
        ppImageView.clipsToBounds = YES;
        ppImageView;
    });
    [self.contentView addSubview:self.arrowImageView];
    self.arrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.arrowImageheight = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:15];
    [self.arrowImageView addConstraint:self.arrowImageheight];
    
    self.arrowImageWidth = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30];
    [self.arrowImageView addConstraint:self.arrowImageWidth];
    
    self.arrowImageRight = [NSLayoutConstraint constraintWithItem:self.arrowImageView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.contentView
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.arrowImageRight];
    
    self.arrowImageY = [NSLayoutConstraint constraintWithItem:self.arrowImageView
                                                    attribute:NSLayoutAttributeCenterY
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self.contentView
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.arrowImageY];
}
- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath
{
    [super updateCellWithSectionModel:sectionModel ItemModel:itemModel AtIndexPath:indexPath];
    
    self.arrowImageY.constant = 0;
    self.arrowImageRight.constant = -itemModel.spacenameRight;
    self.arrowImageheight.constant = itemModel.arrowSize.height;
    self.arrowImageWidth.constant = itemModel.arrowSize.width;;
    
    self.arrowImageView.image = itemModel.arrowImage;
    self.arrowImageView.hidden = NO;
    if (!itemModel.arrowImage) {
        self.arrowImageView.hidden = YES;
    }
}

@end
