//
//  CGXSettingCenterTools.m
//  CGXSettingCenterViewOC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterTools.h"

@implementation CGXSettingCenterTools
//获取文本高度
+ (CGSize)sizeForTextView:(CGSize)constraint WithText:(NSString *) strText WithFont:(UIFont *)font{
    if (!strText||strText.length==0) {
        return CGSizeMake(0, 0);
    }
    CGSize size = [strText boundingRectWithSize:constraint
                                        options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil].size;
    return size;
}

+ (NSMutableAttributedString *)updateTextLeftModel:(CGXSettingCenterSectionTextModel *)nameModel
{
    NSMutableAttributedString *textAttributeStr = ({
        NSMutableParagraphStyle *ppParaStyle = [[NSMutableParagraphStyle alloc] init];
        ppParaStyle.lineBreakMode =NSLineBreakByCharWrapping;
        ppParaStyle.alignment = NSTextAlignmentLeft;
        ppParaStyle.lineSpacing = 5;
        ppParaStyle.paragraphSpacing  = 5;
        NSDictionary *dic = @{NSParagraphStyleAttributeName:ppParaStyle,NSKernAttributeName:@0.0f};
        
        NSString *str1 = nameModel.text;
        NSString *text = [NSString stringWithFormat:@"%@",str1];
        NSMutableAttributedString *ppAttributeStr = [[NSMutableAttributedString alloc]initWithString:text attributes:dic];
        [ppAttributeStr addAttribute:NSFontAttributeName
                               value:nameModel.textFont
                               range:NSMakeRange(0, str1.length)];
        [ppAttributeStr addAttribute:NSForegroundColorAttributeName
                               value:nameModel.textColor
                               range:NSMakeRange(0,str1.length)];
        ppAttributeStr;
    });
    return textAttributeStr;
}

+ (NSMutableAttributedString *)updateTextRightModel:(CGXSettingCenterSectionTextModel *)detailsModel
{
    NSMutableAttributedString *textAttributeStr = ({
        NSMutableParagraphStyle *ppParaStyle = [[NSMutableParagraphStyle alloc] init];
        ppParaStyle.lineBreakMode =NSLineBreakByCharWrapping;
        ppParaStyle.alignment = NSTextAlignmentRight;
        ppParaStyle.lineSpacing = 5;
        ppParaStyle.paragraphSpacing  = 5;
        NSDictionary *dic = @{NSFontAttributeName:detailsModel.textFont,NSParagraphStyleAttributeName:ppParaStyle,NSKernAttributeName:@0.0f};
        NSString *str1 = detailsModel.text;
        NSString *text = [NSString stringWithFormat:@"%@",str1];
        NSMutableAttributedString *ppAttributeStr = [[NSMutableAttributedString alloc]initWithString:text attributes:dic];
        [ppAttributeStr addAttribute:NSFontAttributeName
                               value:detailsModel.textFont
                               range:NSMakeRange(0, str1.length)];
        [ppAttributeStr addAttribute:NSForegroundColorAttributeName
                               value:detailsModel.textColor
                               range:NSMakeRange(0,str1.length)];
        ppAttributeStr;
    });
    return textAttributeStr;
}
//居中间显示
+ (NSMutableAttributedString *)updatCenterModel:(CGXSettingCenterSectionTextModel *)detailsModel
{
    NSMutableAttributedString *textAttributeStr = ({
        NSMutableParagraphStyle *ppParaStyle = [[NSMutableParagraphStyle alloc] init];
        ppParaStyle.lineBreakMode =NSLineBreakByCharWrapping;
        ppParaStyle.alignment = NSTextAlignmentCenter;
        ppParaStyle.lineSpacing = 5;
        ppParaStyle.paragraphSpacing  = 5;
        NSDictionary *dic = @{NSFontAttributeName:detailsModel.textFont,NSParagraphStyleAttributeName:ppParaStyle,NSKernAttributeName:@0.0f};
        NSString *str1 = detailsModel.text;
        NSString *text = [NSString stringWithFormat:@"%@",str1];
        NSMutableAttributedString *ppAttributeStr = [[NSMutableAttributedString alloc]initWithString:text attributes:dic];
        [ppAttributeStr addAttribute:NSFontAttributeName
                               value:detailsModel.textFont
                               range:NSMakeRange(0, str1.length)];
        [ppAttributeStr addAttribute:NSForegroundColorAttributeName
                               value:detailsModel.textColor
                               range:NSMakeRange(0,str1.length)];
        ppAttributeStr;
    });
    return textAttributeStr;
}
+ (NSMutableAttributedString *)updateConvertViewToAttributed:(UIView *)view
{
    UIImage *tagsImage = [self convertViewToImage:view];
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = tagsImage;
    imageAttachment.bounds = view.bounds;
    NSAttributedString *imageAttStr = [NSAttributedString attributedStringWithAttachment:imageAttachment];
    return [[NSMutableAttributedString alloc] initWithAttributedString:imageAttStr];;
}
//使用该方法不会模糊，根据屏幕密度计算
+ (UIImage *)convertViewToImage:(UIView *)view
{
    UIImage *imageRet = [[UIImage alloc]init];
    //UIGraphicsBeginImageContextWithOptions(区域大小, 是否是非透明的, 屏幕密度);
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageRet;
}


/**
 *  判断是否为空或为空格
 *  @return YES OR NOT
 */
+ (BOOL)gx_isEmpty:(NSString *)str
{
    if (str == nil || str == NULL){
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]){
        return YES;
    }
    if ([str isEqual:[NSNull class]]){
        return YES;
    }
    if ([str isEqualToString:@""]) {
        return YES;
    }
    if ([str isEqualToString:@"<null>"]){
        return YES;
    }
    if ([str isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([str length] == 0) {
        return YES;
    }
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        return YES;
    }
    return NO;
}
@end
