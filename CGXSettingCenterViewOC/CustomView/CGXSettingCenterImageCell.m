//
//  CGXSettingCenterImageCell.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterImageCell.h"
@interface CGXSettingCenterImageCell()

@property (nonatomic, strong) UIImageView *headImageView;//左侧功能图片

@property (nonatomic , strong) NSLayoutConstraint *headImageY;
@property (nonatomic , strong) NSLayoutConstraint *headImageRight;
@property (nonatomic , strong) NSLayoutConstraint *headImageWidth;
@property (nonatomic , strong) NSLayoutConstraint *headImageheight;
@end
@implementation CGXSettingCenterImageCell

- (void)initializeViews
{
    [super initializeViews];
    self.headImageView = ({
        UIImageView *ppImageView = [[UIImageView alloc] init];
        ppImageView.contentMode = UIViewContentModeScaleAspectFit;
        ppImageView.layer.masksToBounds = YES;
        ppImageView.clipsToBounds = YES;
        ppImageView;
    });
    [self.contentView addSubview:self.headImageView];
    self.headImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.headImageheight = [NSLayoutConstraint constraintWithItem:self.headImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30];
    [self.headImageView addConstraint:self.headImageheight];
    
    self.headImageWidth = [NSLayoutConstraint constraintWithItem:self.headImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30];
    [self.headImageView addConstraint:self.headImageWidth];
    
    self.headImageRight = [NSLayoutConstraint constraintWithItem:self.headImageView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.contentView
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.headImageRight];
    
    self.headImageY = [NSLayoutConstraint constraintWithItem:self.headImageView
                                                    attribute:NSLayoutAttributeCenterY
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self.contentView
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.headImageY];
}

- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath
{
    [super updateCellWithSectionModel:sectionModel ItemModel:itemModel AtIndexPath:indexPath];

    self.headImageY.constant = 0;
    self.headImageRight.constant = -itemModel.spacenameRight-itemModel.arrowSize.width-itemModel.spaceArrowRight;
    self.headImageheight.constant = itemModel.headerSize.height;
    self.headImageWidth.constant = itemModel.headerSize.width;;
    self.headImageView.image = itemModel.headerImage;
    __weak typeof(self) weakSelf = self;
    if (itemModel.loadImageBlock) {
        itemModel.loadImageBlock(weakSelf.headImageView,itemModel.headerUrl);
    }
}

@end
