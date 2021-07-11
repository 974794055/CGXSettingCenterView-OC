//
//  CGXSettingCenterHeaderView.m
//  CGXSettingCenterViewOC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterHeaderView.h"

#import "CGXSettingCenterTools.h"
@interface CGXSettingCenterHeaderView()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic , strong) NSLayoutConstraint *titleLabelTop;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelBottom;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelLeft;
@property (nonatomic , strong) NSLayoutConstraint *titleLabelRight;

@end

@implementation CGXSettingCenterHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = ({
            UILabel *ppLabel = [[UILabel alloc]init];
            ppLabel.font = [UIFont systemFontOfSize:14];
            ppLabel.textColor = [UIColor blackColor];
            ppLabel.textAlignment = NSTextAlignmentLeft;
            ppLabel.numberOfLines = 0;
            ppLabel.layer.masksToBounds = YES;
            ppLabel.text = @"";
            ppLabel;
        });
        [self.contentView addSubview:self.titleLabel];
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
    return self;
}
/*
 sectionmodel:分区model
 section。   ：所在分区
 */
- (void)updateHeaderViewWithSectionModel:(CGXSettingCenterSectionModel *)sectionmodel
                         AtInSection:(NSInteger)section
{
    self.titleLabelTop.constant = 0;
    self.titleLabelBottom.constant = 0;
    self.titleLabelLeft.constant = sectionmodel.headerModel.textSpaceLeft;
    self.titleLabelRight.constant = -sectionmodel.headerModel.textSpaceRight;
    
    self.titleLabel.text = sectionmodel.headerModel.text;
    self.titleLabel.textColor = sectionmodel.headerModel.textColor;
    self.titleLabel.font = sectionmodel.headerModel.textFont;
    
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    NSMutableAttributedString *text1AttributeStr = [CGXSettingCenterTools updateTextLeftModel:sectionmodel.headerModel];
    if (sectionmodel.headerModel.textAttring && sectionmodel.headerModel.textAttring > 0) {
        text1AttributeStr = sectionmodel.headerModel.textAttring;
    }
    self.titleLabel.attributedText = text1AttributeStr;
    
//    CGSize size2 = [text2AttributeStr boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.contentView.frame)-sectionmodel.headSpaceLeft-sectionmodel.headSpaceRight, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading context:nil].size;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
