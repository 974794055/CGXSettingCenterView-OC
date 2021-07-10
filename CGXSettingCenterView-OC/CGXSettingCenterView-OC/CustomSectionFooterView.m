//
//  CustomSectionFooterView.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CustomSectionFooterView.h"
@interface CustomSectionFooterView()

@property (nonatomic, strong) UILabel       *titleLabel;

@end
@implementation CustomSectionFooterView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

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
        
       
    }
    return self;
}
/*
 sectionmodel:分区model
 section。   ：所在分区
 */
- (void)updateSectionViewWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         AtInSection:(NSInteger)section
{
    NSMutableAttributedString *textAttributeStr = ({
        NSMutableParagraphStyle *ppParaStyle = [[NSMutableParagraphStyle alloc] init];
        ppParaStyle.lineBreakMode =NSLineBreakByWordWrapping;
        ppParaStyle.alignment = NSTextAlignmentLeft;
        ppParaStyle.lineSpacing = 5;
        ppParaStyle.paragraphSpacing  = 0;
        NSDictionary *dic = @{NSParagraphStyleAttributeName:ppParaStyle,NSKernAttributeName:@0.0f};
        NSString *str1 = @"脚部分";;
        NSString *str2 = [NSString stringWithFormat:@"(脚部分脚部分%ld)",section];
        NSString *text = [NSString stringWithFormat:@"%@ %@",str1,str2];
        NSMutableAttributedString *ppAttributeStr = [[NSMutableAttributedString alloc]initWithString:text attributes:dic];
        [ppAttributeStr addAttribute:NSFontAttributeName
                               value:[UIFont systemFontOfSize:15]
                               range:NSMakeRange(0, text.length)];
        [ppAttributeStr addAttribute:NSForegroundColorAttributeName
                               value:[UIColor blackColor]
                               range:NSMakeRange(0,text.length)];
        
        [ppAttributeStr addAttribute:NSFontAttributeName
                               value:[UIFont systemFontOfSize:12]
                               range:NSMakeRange(text.length-str2.length, str2.length)];
        [ppAttributeStr addAttribute:NSForegroundColorAttributeName
                               value:[UIColor grayColor]
                               range:NSMakeRange(text.length-str2.length, str2.length)];
        
        ppAttributeStr;
    });
    self.titleLabel.attributedText = textAttributeStr;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:10];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:10];
    [self addConstraints:@[top, leading, bottom, trailing]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
