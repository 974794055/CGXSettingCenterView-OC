//
//  CustomHeaderView.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CustomHeaderView.h"

@interface CustomHeaderView()

@property (nonatomic, strong) UILabel       *nameLabel;

@end

@implementation CustomHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        self.nameLabel = ({
            UILabel *ppLabel = [[UILabel alloc]init];
            ppLabel.font = [UIFont systemFontOfSize:14];
            ppLabel.textColor = [UIColor blackColor];
            ppLabel.textAlignment = NSTextAlignmentCenter;
            ppLabel.numberOfLines = 0;
            ppLabel.layer.masksToBounds = YES;
            ppLabel.text = @"";
            ppLabel;
        });
        [self addSubview:self.nameLabel];
        
        self.nameLabel.text = @"自定义脚部分";
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.nameLabel.frame = self.bounds;

}

@end
