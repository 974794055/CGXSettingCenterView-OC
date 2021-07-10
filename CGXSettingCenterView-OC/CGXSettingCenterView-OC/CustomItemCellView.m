//
//  CustomItemCellView.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CustomItemCellView.h"

@interface CustomItemCellView()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic , strong) NSLayoutConstraint *titleLabelTop;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelBottom;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelLeft;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelRight;

@end

@implementation CustomItemCellView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        [self initializeViews];
    }
    return self;
}

- (void)initializeViews
{
    self.titleLabel = ({
        UILabel *ppLabel = [[UILabel alloc]init];
        ppLabel.font = [UIFont systemFontOfSize:14];
        ppLabel.textColor = [UIColor blackColor];
        ppLabel.textAlignment = NSTextAlignmentCenter;
        ppLabel.numberOfLines = 0;
        ppLabel.layer.masksToBounds = YES;
        ppLabel.text = @"";
        ppLabel;
    });
    [self addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabelTop = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1.0 constant:0];
    self.titleLabelLeft = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1.0 constant:0];
    self.titleLabelBottom = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0 constant:0];
    
    self.titleLabelRight = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0 constant:0];
    [self addConstraint:self.titleLabelTop];
    [self addConstraint:self.titleLabelLeft];
    [self addConstraint:self.titleLabelBottom];
    [self addConstraint:self.titleLabelRight];
    
}
- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath
{
    self.titleLabel.text = itemModel.nameModel.text;
    self.titleLabel.font = itemModel.nameModel.textFont;
    self.titleLabel.textColor = itemModel.nameModel.textColor;
    self.titleLabelTop.constant = 0;
    self.titleLabelBottom.constant = 0;
    self.titleLabelRight.constant = -20;
    self.titleLabelLeft.constant = 20;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
