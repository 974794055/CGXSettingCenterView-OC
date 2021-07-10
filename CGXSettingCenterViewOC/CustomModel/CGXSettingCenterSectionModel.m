//
//  CGXSettingCenterSectionModel.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterSectionModel.h"
@interface CGXSettingCenterSectionModel()

//默认不适用xib
@property (nonatomic , assign,readwrite) BOOL isXib;
@property(nonatomic, strong,readwrite) Class cellClass;

@end
@implementation CGXSettingCenterSectionModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.rowArray = [NSMutableArray array];
        self.footerHeight = 0;
        self.footerBgColor = [UIColor clearColor];
        self.headerHeight = 0;
        self.headerBgColor = [UIColor clearColor];
        
        self.headerModel = [[CGXSettingCenterSectionTextModel alloc] init];
        self.footerModel = [[CGXSettingCenterSectionTextModel alloc] init];

        
    }
    return self;
}

@end
