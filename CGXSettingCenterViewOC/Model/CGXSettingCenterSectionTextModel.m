//
//  CGXSettingCenterSectionTextModel.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterSectionTextModel.h"

@implementation CGXSettingCenterSectionTextModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.text = @"";
        self.textColor = [UIColor blackColor];
        self.textFont = [UIFont systemFontOfSize:14];
        self.textSpaceLeft = 10;
        self.textSpaceRight = 10;
    }
    return self;
}

@end
