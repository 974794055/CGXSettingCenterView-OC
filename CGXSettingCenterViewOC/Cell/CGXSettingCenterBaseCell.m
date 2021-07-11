//
//  CGXSettingCenterBaseCell.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterBaseCell.h"

@interface CGXSettingCenterBaseCell()

@property (nonatomic,strong,readwrite) CGXSettingCenterSectionModel *sectionmodel;
@property (nonatomic,strong,readwrite) CGXSettingCenterSectionItemModel *itemModel;
@property (nonatomic,assign,readwrite) NSIndexPath *indexPath;

@property (nonatomic, strong,readwrite) UILabel *nameLabel;//左侧功能名称
@property (nonatomic, strong,readwrite) UIImageView *nameImgView;//左侧功能图片

@property (nonatomic , strong) NSLayoutConstraint *nameTop;
@property (nonatomic , strong) NSLayoutConstraint *nameBottom;
@property (nonatomic , strong) NSLayoutConstraint *nameLeft;
@property (nonatomic , strong) NSLayoutConstraint *nameWidth;

@property (nonatomic , strong) NSLayoutConstraint *nameImageY;
@property (nonatomic , strong) NSLayoutConstraint *nameImageLeft;
@property (nonatomic , strong) NSLayoutConstraint *nameImageWidth;
@property (nonatomic , strong) NSLayoutConstraint *nameImageheight;

@property (nonatomic, strong) UIView *lineView;//左侧功能名称

@property (nonatomic , strong) NSLayoutConstraint *lineRight;
@property (nonatomic , strong) NSLayoutConstraint *lineBottom;
@property (nonatomic , strong) NSLayoutConstraint *lineLeft;
@property (nonatomic , strong) NSLayoutConstraint *lineHeight;

@end

@implementation CGXSettingCenterBaseCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        [self initializeViews];
    }
    return self;
}
- (void)initializeViews
{
    self.nameLabel = ({
        UILabel *ppLabel = [[UILabel alloc]init];
        ppLabel.font = [UIFont systemFontOfSize:14];
        ppLabel.textColor = [UIColor blackColor];
        ppLabel.textAlignment = NSTextAlignmentLeft;
        ppLabel.numberOfLines = 0;
        ppLabel.layer.masksToBounds = YES;
        ppLabel.text = @"";
        ppLabel;
    });
    [self.contentView addSubview:self.nameLabel];
    
    self.nameImgView = ({
        UIImageView *ppImageView = [[UIImageView alloc] init];
        ppImageView.contentMode = UIViewContentModeScaleAspectFit;
        ppImageView.layer.masksToBounds = YES;
        ppImageView.clipsToBounds = YES;
        ppImageView;
    });
    [self.contentView addSubview:self.nameImgView];
    
    self.lineView= ({
        UIView *ppView = [[UIView alloc] init];
        ppView.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
        ppView;
    });
    [self.contentView addSubview:self.lineView];
    [self.contentView bringSubviewToFront:self.lineView];
    
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameImgView.translatesAutoresizingMaskIntoConstraints = NO;
    self.lineView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.nameTop = [NSLayoutConstraint constraintWithItem:self.nameLabel
                                                attribute:NSLayoutAttributeTop
                                                relatedBy:NSLayoutRelationEqual
                                                   toItem:self.contentView
                                                attribute:NSLayoutAttributeTop
                                               multiplier:1.0 constant:0];
    self.nameLeft = [NSLayoutConstraint constraintWithItem:self.nameLabel
                                                 attribute:NSLayoutAttributeLeft
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:self.contentView
                                                 attribute:NSLayoutAttributeLeft
                                                multiplier:1.0 constant:0];
    self.nameBottom = [NSLayoutConstraint constraintWithItem:self.nameLabel
                                                   attribute:NSLayoutAttributeBottom
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self.contentView
                                                   attribute:NSLayoutAttributeBottom
                                                  multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.nameTop];
    [self.contentView addConstraint:self.nameLeft];
    [self.contentView addConstraint:self.nameBottom];
    self.nameWidth = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:60];
    [self.nameLabel addConstraint:self.nameWidth];
    
    
    self.nameImageheight = [NSLayoutConstraint constraintWithItem:self.nameImgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:15];
    [self.nameImgView addConstraint:self.nameImageheight];
    
    self.nameImageWidth = [NSLayoutConstraint constraintWithItem:self.nameImgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30];
    [self.nameImgView addConstraint:self.nameImageWidth];
    
    self.nameImageLeft = [NSLayoutConstraint constraintWithItem:self.nameImgView
                                                      attribute:NSLayoutAttributeLeft
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeLeft
                                                     multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.nameImageLeft];
    
    self.nameImageY = [NSLayoutConstraint constraintWithItem:self.nameImgView
                                                   attribute:NSLayoutAttributeCenterY
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self.contentView
                                                   attribute:NSLayoutAttributeCenterY
                                                  multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.nameImageY];
    
    
    self.lineLeft = [NSLayoutConstraint constraintWithItem:self.lineView
                                                 attribute:NSLayoutAttributeLeft
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:self.contentView
                                                 attribute:NSLayoutAttributeLeft
                                                multiplier:1.0 constant:0];
    self.lineRight = [NSLayoutConstraint constraintWithItem:self.lineView
                                                  attribute:NSLayoutAttributeRight
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:self.contentView
                                                  attribute:NSLayoutAttributeRight
                                                 multiplier:1.0 constant:0];
    self.lineBottom = [NSLayoutConstraint constraintWithItem:self.lineView
                                                   attribute:NSLayoutAttributeBottom
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self.contentView
                                                   attribute:NSLayoutAttributeBottom
                                                  multiplier:1.0 constant:0];
    [self.contentView addConstraint:self.lineLeft];
    [self.contentView addConstraint:self.lineRight];
    [self.contentView addConstraint:self.lineBottom];
    self.lineHeight = [NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:0.5];
    [self.lineView addConstraint:self.lineHeight];
}

- (void)updateCellWithSectionModel:(CGXSettingCenterSectionModel *)sectionModel
                         ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
                       AtIndexPath:(NSIndexPath *)indexPath
{
    self.contentView.backgroundColor = itemModel.cellColor;
    
    self.nameImgView.hidden = YES;
    self.sectionmodel = sectionModel;
    self.itemModel = itemModel;
    self.indexPath = indexPath;
    self.nameLabel.text = itemModel.nameModel.text;
    self.nameLabel.font = itemModel.nameModel.textFont;
    self.nameLabel.textColor = itemModel.nameModel.textColor;
    
    NSMutableAttributedString *textAttributeStr = [CGXSettingCenterTools updateTextLeftModel:itemModel.nameModel];
    if (itemModel.nameModel.textAttring && itemModel.nameModel.textAttring > 0) {
        textAttributeStr = itemModel.nameModel.textAttring;
    }
    self.nameLabel.attributedText = textAttributeStr;
    
    CGSize nameSize = [textAttributeStr boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.contentView.frame)*itemModel.nameMacWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size;

    if (itemModel.nameImage) {
        self.nameImgView.hidden = NO;
        self.nameImgView.image = itemModel.nameImage;
        
        if (itemModel.loadImageBlock) {
            itemModel.loadImageBlock(self.nameImgView, itemModel.headerUrl);
        }
        self.nameImageY.constant = 0;
        self.nameImageLeft.constant = itemModel.spacenameLeft;
        self.nameImageheight.constant = itemModel.nameImageSize.height;
        self.nameImageWidth.constant = itemModel.nameImageSize.width;;
        
        self.nameTop.constant = 0;
        self.nameLeft.constant = itemModel.spacenameLeft + itemModel.nameImageSize.width + itemModel.spaceNameImage;
        self.nameWidth.constant = nameSize.width;
        self.nameBottom.constant = 0;
        
    } else{
        self.nameTop.constant = 0;
        self.nameLeft.constant = itemModel.spacenameLeft;
        self.nameWidth.constant = nameSize.width;
        self.nameBottom.constant = 0;
    }
    
    self.lineRight.constant = -itemModel.spacelineRight;
    self.lineLeft.constant = itemModel.spacelineLeft;
    self.lineBottom.constant = 0;
    self.lineHeight.constant = 0.5;
    self.lineView.hidden = !itemModel.isLine;
    

//    self.nameLabel.backgroundColor = [UIColor redColor];
}

@end
