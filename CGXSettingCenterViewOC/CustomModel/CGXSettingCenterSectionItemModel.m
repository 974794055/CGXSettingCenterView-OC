//
//  CGXSettingCenterSectionItemModel.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterSectionItemModel.h"
#import "CGXSettingCenterTools.h"
@interface CGXSettingCenterSectionItemModel()

@property (nonatomic, strong,readwrite) Class cellClass;
@property (nonatomic, assign,readwrite) CGXSettingCenterSectionType sectionType;

@end
@implementation CGXSettingCenterSectionItemModel
- (NSString *)cellIdentifier {
    return [NSString stringWithFormat:@"%@", self.cellClass];
}

- (instancetype)initWithSectionType:(CGXSettingCenterSectionType)sectionType
{
    self = [super init];
    if (self) {
        self.sectionType = sectionType;
        switch (sectionType) {
            case CGXSettingCenterSectionTypeNode:
            {
                self.cellClass = [UITableViewCell class];
            }
                break;
            case CGXSettingCenterSectionTypeHeader:
            {
                self.cellClass = [NSClassFromString(@"CGXSettingCenterImageCell") class];
            }
                break;
            case CGXSettingCenterSectionTypeSwitch:
            {
                self.cellClass = [NSClassFromString(@"CGXSettingCenterSwitchCell") class];
            }
                break;
            case CGXSettingCenterSectionTypeText:
            {
                self.cellClass = [NSClassFromString(@"CGXSettingCenterTextCell") class];
            }
                break;
            case CGXSettingCenterSectionTypeTitle:
            {
                self.cellClass = [NSClassFromString(@"CGXSettingCenterTitleCell") class];
            }
                break;
            case CGXSettingCenterSectionTypeCustom:
            {
                self.cellClass = [NSClassFromString(@"CGXSettingCenterCustomCell") class];
            }
                break;
            default:
            {
                self.cellClass = [UITableViewCell class];
            }
                break;
        }
        [self initializeData];
    }
    return self;
}
- (void)initializeData
{
    self.cellColor = [UIColor whiteColor];
    self.isLine = YES;
    self.lineViewColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];;
    self.spacelineLeft = 10;
    self.spacelineRight = 0;
    
    self.nameMacWidth = 2/3.0;
    
    self.cellHeight = 44;
    self.nameModel = [[CGXSettingCenterSectionTextModel alloc] init];
    self.nameModel.textColor = [UIColor blackColor];
    self.nameModel.textFont = [UIFont systemFontOfSize:15];
    
    self.nameImageSize = CGSizeMake(20, 20);
    self.spacenameLeft = 10;
    self.spaceNameImage = 10;
    self.arrowSize = CGSizeMake(10, 10);
    self.spacenameRight = 10;
    self.spaceArrowRight = 10;
    self.spaceArrowLeft = 10;
    self.detailModel = [[CGXSettingCenterSectionTextModel alloc] init];
    self.detailModel.textColor = [UIColor blackColor];
    self.detailModel.textFont = [UIFont systemFontOfSize:12];
    
    self.headerSize = CGSizeMake(30, 30);;
    self.switchOpen = NO;
}
- (void)setNameMacWidth:(CGFloat)nameMacWidth
{
    if (nameMacWidth < 0.1){
        nameMacWidth = 0.1;
    }
    if (nameMacWidth > 0.9){
        nameMacWidth = 0.9;
    }
    _nameMacWidth = nameMacWidth;
}
@end
