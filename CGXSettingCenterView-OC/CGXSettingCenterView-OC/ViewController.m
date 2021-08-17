//
//  ViewController.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "ViewController.h"
#import <CGXSettingCenterViewOC/CGXSettingCenterViewOC.h>
#import "CustomFooterView.h"
#import "CustomHeaderView.h"
#import "CustomItemCellView.h"
#import "CustomSectionFooterView.h"
#import "CustomSectionHeaderView.h"
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define RandomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()<CGXSettingCenterViewDelegate>

@property (nonatomic, strong) CGXSettingCenterView *setView;
@property (nonatomic, assign) BOOL isCustom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.isCustom = NO;
    
    self.setView = [[CGXSettingCenterView alloc] init];
    self.setView.delegate = self;
    self.setView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    [self.view addSubview:self.setView];
    self.setView.showsVerticalScrollIndicator = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"自定义头分区脚分区" style:UIBarButtonItemStyleDone target:self action:@selector(clickItemm:)];
    
    UIColor *setBgColor = [UIColor colorWithWhite:0.93 alpha:1];
    NSMutableArray *dataArray = [NSMutableArray array];
    CGXSettingCenterSectionModel *sectionM1 = ({
        CGXSettingCenterSectionModel *sectionModel = [[CGXSettingCenterSectionModel alloc] init];
        NSMutableArray *rowArray = [NSMutableArray array];
        
        CGXSettingCenterSectionItemModel *itemM1 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeHeader];
            itemModel.cellHeight = 60;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"头像";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            itemModel.headerSize = CGSizeMake(50, 50);;
            itemModel.headerImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            
            itemModel.arrowImage = [UIImage imageNamed:@"UserCenterVipArray2"];
            itemModel.loadImageBlock = ^(UIImageView * _Nonnull headerImageView, NSURL * _Nonnull headerUrl) {
                headerImageView.image = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            };
            itemModel;
        });
        [rowArray addObject:itemM1];
        
        CGXSettingCenterSectionItemModel *itemM2 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeSwitch];
            itemModel.cellHeight = 44;
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"推送通知";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            itemModel;
        });
        [rowArray addObject:itemM2];
        CGXSettingCenterSectionItemModel *itemM2_1 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeSwitch];
            itemModel.cellHeight = 44;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"推送通知";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            itemModel.switchBlock = ^(UISwitch * _Nonnull itemSwitch) {
                itemSwitch.transform = CGAffineTransformMakeScale(0.8, 0.8);
                itemSwitch.tintColor = [UIColor colorWithRed:252/255.0 green:115/255.0 blue:186/255.0 alpha:1];
                itemSwitch.onTintColor = [UIColor colorWithRed:252/255.0 green:115/255.0 blue:186/255.0 alpha:1];
            };
            itemModel;
        });
        [rowArray addObject:itemM2_1];
        
        CGXSettingCenterSectionItemModel *itemM3 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            
            itemModel.cellHeight = 44;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"账户与安全";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            itemModel.detailModel.text = @"未认证";
            itemModel.detailModel.textColor = [UIColor orangeColor];
            itemModel.detailModel.textFont = [UIFont systemFontOfSize:12];
            
            itemModel.arrowSize = CGSizeMake(10, 10);
            itemModel.arrowImage = [UIImage imageNamed:@"UserCenterVipArray2"];
            
            itemModel;
        });
        [rowArray addObject:itemM3];
        
        CGXSettingCenterSectionItemModel *itemM4 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            itemModel.cellHeight = 44;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"主标题";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            itemModel.detailModel.text = @"会员到期时间2020-10-08";
            itemModel.detailModel.textColor = [UIColor blackColor];
            itemModel.detailModel.textFont = [UIFont systemFontOfSize:12];
            itemModel;
        });
        [rowArray addObject:itemM4];
        
        CGXSettingCenterSectionItemModel *itemM5 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            itemModel.cellHeight = 44;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"主标题";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            
            itemModel.detailModel.text = @"会员到期时间2020-10-08";
            itemModel.detailModel.textColor = [UIColor blackColor];
            itemModel.detailModel.textFont = [UIFont systemFontOfSize:12];
            
            
            itemModel.arrowSize = CGSizeMake(10, 10);
            itemModel.arrowImage = [UIImage imageNamed:@"UserCenterVipArray2"];
            itemModel;
        });
        [rowArray addObject:itemM5];
        
        CGXSettingCenterSectionItemModel *itemM6 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            
            itemModel.cellHeight = 44;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"主标题主标题主标题主标题";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            itemModel.detailModel.text = @"会员到期时间2020-10-08";
            itemModel.detailModel.textColor = [UIColor blackColor];
            itemModel.detailModel.textFont = [UIFont systemFontOfSize:12];
            
            itemModel;
        });
        [rowArray addObject:itemM6];
        
        CGXSettingCenterSectionItemModel *itemM7 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            itemModel.cellHeight = 44;
            
            NSMutableAttributedString *textAttributeStr = ({
                NSMutableParagraphStyle *ppParaStyle = [[NSMutableParagraphStyle alloc] init];
                ppParaStyle.lineBreakMode =NSLineBreakByWordWrapping;
                ppParaStyle.alignment = NSTextAlignmentLeft;
                ppParaStyle.lineSpacing = 5;
                ppParaStyle.paragraphSpacing  = 0;
                NSDictionary *dic = @{NSParagraphStyleAttributeName:ppParaStyle,NSKernAttributeName:@0.0f};
                NSString *str1 = @"主标题主标题";;
                NSString *str2 = @"子标题子标题子标题";;
                NSString *text = [NSString stringWithFormat:@"%@\n%@",str1,str2];
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
            itemModel.nameModel.textAttring = textAttributeStr;
            
            itemModel.detailModel.text = @"会员到期时间2020-10-08";
            itemModel.detailModel.textColor = [UIColor blackColor];
            itemModel.detailModel.textFont = [UIFont systemFontOfSize:12];
            itemModel;
        });
        [rowArray addObject:itemM7];
        
        CGXSettingCenterSectionItemModel *itemM8 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            itemModel.cellHeight = 44;
            
            NSMutableAttributedString *textAttributeStr = ({
                NSMutableParagraphStyle *ppParaStyle = [[NSMutableParagraphStyle alloc] init];
                ppParaStyle.lineBreakMode =NSLineBreakByWordWrapping;
                ppParaStyle.alignment = NSTextAlignmentLeft;
                ppParaStyle.lineSpacing = 5;
                ppParaStyle.paragraphSpacing  = 0;
                NSDictionary *dic = @{NSParagraphStyleAttributeName:ppParaStyle,NSKernAttributeName:@0.0f};
                NSString *str1 = @"主标题";;
                NSString *str2 = @"(子标题子标题)";;
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
            itemModel.nameModel.textAttring = textAttributeStr;
            itemModel.detailModel.text = @"会员到期时间2020-10-08";
            itemModel.detailModel.textColor = [UIColor blackColor];
            itemModel.detailModel.textFont = [UIFont systemFontOfSize:12];
            itemModel;
        });
        [rowArray addObject:itemM8];
        
        CGXSettingCenterSectionItemModel *itemM81 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            itemModel.cellHeight = 44;
            
            UIView *tagView = ({
                UIView *view  = [[UIView alloc] init];
                UILabel *ppLabel = [[UILabel alloc]init];
                ppLabel.font = [UIFont systemFontOfSize:15];
                ppLabel.textColor = [UIColor blackColor];
                ppLabel.textAlignment = NSTextAlignmentRight;
                ppLabel.numberOfLines = 0;
                ppLabel.layer.masksToBounds = YES;
                ppLabel.text = @"主标题";
                [view addSubview:ppLabel];
                UIView *redView = [[UIView alloc] init];
                redView.backgroundColor = [UIColor redColor];
                redView.layer.masksToBounds = YES;
                redView.layer.cornerRadius = 3;
                [view addSubview:redView];
                [ppLabel sizeToFit];
                ppLabel.frame = CGRectMake(0, 0, CGRectGetWidth(ppLabel.frame)+1, 20);
                ppLabel.layer.cornerRadius = 10;
                redView.frame = CGRectMake(CGRectGetMaxX(ppLabel.frame)+5, 7, 6, 6);
                
                view.frame = CGRectMake(0, 0, CGRectGetMaxX(redView.frame)+1, 20);
                view;
            });
            NSMutableAttributedString *textAttributeStr =  [CGXSettingCenterTools updateConvertViewToAttributed:tagView];
            itemModel.nameModel.textAttring = textAttributeStr;
            
            itemModel.detailModel.text = @"会员到期时间2020-10-08";
            itemModel.detailModel.textColor = [UIColor blackColor];
            itemModel.detailModel.textFont = [UIFont systemFontOfSize:12];
            itemModel;
        });
        [rowArray addObject:itemM81];
        
        
        CGXSettingCenterSectionItemModel *itemM9 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            itemModel.cellHeight = 44;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"账户与安全";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            UIView *tagView = ({
                UIView *view  = [[UIView alloc] init];
                UILabel *ppLabel = [[UILabel alloc]init];
                ppLabel.font = [UIFont systemFontOfSize:12];
                ppLabel.textColor = [UIColor whiteColor];
                ppLabel.backgroundColor = [UIColor redColor];
                ppLabel.textAlignment = NSTextAlignmentCenter;
                ppLabel.numberOfLines = 0;
                ppLabel.layer.masksToBounds = YES;
                ppLabel.text = @"主标题";
                [view addSubview:ppLabel];
                ppLabel.frame = CGRectMake(0, 0, 60, 20);
                ppLabel.layer.cornerRadius = 10;
                view.frame = CGRectMake(0, 0, 60, 20);
                view;
            });
            itemModel.detailModel.textAttring = [CGXSettingCenterTools updateConvertViewToAttributed:tagView];
            
            itemModel.arrowSize = CGSizeMake(10, 10);
            itemModel.arrowImage = [UIImage imageNamed:@"UserCenterVipArray2"];
            itemModel;
        });
        [rowArray addObject:itemM9];
        
        
        CGXSettingCenterSectionItemModel *itemM10 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeText];
            itemModel.cellHeight = 44;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"账户与安全";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            UIView *tagView = ({
                UIView *view  = [[UIView alloc] init];
                UILabel *ppLabel = [[UILabel alloc]init];
                ppLabel.font = [UIFont systemFontOfSize:12];
                ppLabel.textColor = [UIColor blackColor];
                ppLabel.textAlignment = NSTextAlignmentRight;
                ppLabel.numberOfLines = 0;
                ppLabel.layer.masksToBounds = YES;
                ppLabel.text = @"主标题";
                [view addSubview:ppLabel];
                UIView *redView = [[UIView alloc] init];
                redView.backgroundColor = [UIColor redColor];
                redView.layer.masksToBounds = YES;
                redView.layer.cornerRadius = 3;
                [view addSubview:redView];
                
                ppLabel.frame = CGRectMake(0, 0, 60, 20);
                ppLabel.layer.cornerRadius = 10;
                redView.frame = CGRectMake(62, 7, 6, 6);
                
                view.frame = CGRectMake(0, 0, 70, 20);
                view;
            });
            itemModel.detailModel.textAttring = [CGXSettingCenterTools updateConvertViewToAttributed:tagView];
            
            itemModel.arrowSize = CGSizeMake(10, 10);
            itemModel.arrowImage = [UIImage imageNamed:@"UserCenterVipArray2"];
            itemModel;
        });
        [rowArray addObject:itemM10];
        
        sectionModel.rowArray = rowArray;
        sectionModel.headerModel.text = @"分区分区头分区0";
        sectionModel.headerBgColor = setBgColor;
        sectionModel.headerHeight = 40;

        sectionModel.footerModel.text = @"分区分区脚分区0分区分区脚分区0分区分区脚分区0分区分区脚分区0";
        sectionModel.footerBgColor = setBgColor;
        sectionModel.footerHeight = 40;
        
        sectionModel;
    });
    [dataArray addObject:sectionM1];
    

    

    
    
    CGXSettingCenterSectionModel *sectionM4 = ({
        CGXSettingCenterSectionModel *sectionModel = [[CGXSettingCenterSectionModel alloc] init];
        NSMutableArray *rowArray = [NSMutableArray array];
        
        CGXSettingCenterSectionItemModel *itemM9 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeCustom];
            itemModel.cellHeight = 44;
            
            itemModel.nameImage = [UIImage imageNamed:@"UserCenterClickOrderAll"];
            itemModel.nameModel.text = @"自定义cell  自定义cell";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            
            itemModel.detailModel.text = @"未认证";
            itemModel.detailModel.textColor = [UIColor whiteColor];
            itemModel.detailModel.textFont = [UIFont systemFontOfSize:12];
            
            itemModel.arrowSize = CGSizeMake(10, 10);
            itemModel.arrowImage = [UIImage imageNamed:@"UserCenterVipArray2"];
            itemModel;
        });
        [rowArray addObject:itemM9];
        sectionModel.rowArray = rowArray;

        sectionModel.headerModel.text = @"分区头分区1";
        sectionModel.headerBgColor = setBgColor;
        sectionModel.headerHeight = 40;
        
        sectionModel.footerModel.text = @"分区脚分区呀呀呀";
        sectionModel.footerBgColor = setBgColor;
        sectionModel.footerHeight = 40;
        
        sectionModel;
    });
    [dataArray addObject:sectionM4];
    
    
    CGXSettingCenterSectionModel *sectionM2 = ({
        CGXSettingCenterSectionModel *sectionModel = [[CGXSettingCenterSectionModel alloc] init];
        NSMutableArray *rowArray = [NSMutableArray array];
        
        CGXSettingCenterSectionItemModel *itemM9 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeTitle];
            itemModel.cellHeight = 44;
            itemModel.nameModel.text = @"切换账号";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            itemModel;
        });
        [rowArray addObject:itemM9];
        sectionModel.rowArray = rowArray;
        sectionModel.headerBgColor = setBgColor;
        sectionModel.headerHeight = 10;
        sectionModel.footerBgColor = setBgColor;
        sectionModel.footerHeight = 10;
        sectionModel;
    });
    [dataArray addObject:sectionM2];
    
    CGXSettingCenterSectionModel *sectionM3 = ({
        CGXSettingCenterSectionModel *sectionModel = [[CGXSettingCenterSectionModel alloc] init];
        NSMutableArray *rowArray = [NSMutableArray array];
        
        CGXSettingCenterSectionItemModel *itemM9 = ({
            CGXSettingCenterSectionItemModel *itemModel = [[CGXSettingCenterSectionItemModel alloc] initWithSectionType:CGXSettingCenterSectionTypeTitle];
            itemModel.cellHeight = 44;
            itemModel.nameModel.text = @"退出登陆";
            itemModel.nameModel.textColor = [UIColor blackColor];
            itemModel.nameModel.textFont = [UIFont systemFontOfSize:15];
            itemModel;
        });
        [rowArray addObject:itemM9];
        sectionModel.rowArray = rowArray;
        sectionModel.headerBgColor = setBgColor;
        sectionModel.headerHeight = 10;
        sectionModel.footerBgColor = setBgColor;
        sectionModel.footerHeight = 10;
        
        sectionModel;
    });
    [dataArray addObject:sectionM3];
    
    [self.setView updateWithDataArray:dataArray];
    [self.setView updateWithTableHeaderView];
    [self.setView updateWithTableFooterView];
    
}
/*
 点击cell
 */
- (void)gxSettingCenterView:(CGXSettingCenterView *)centerView didSelectRowAtIndexPath:(NSIndexPath *)indexPath ItemModel:(CGXSettingCenterSectionItemModel *)itemModel
{
    NSLog(@"%@--%@" , itemModel.nameModel.text,indexPath);
    if (indexPath.section == 0&& indexPath.row == 0) {
        itemModel.nameModel.text = [NSString stringWithFormat:@"头像-%u",arc4random() % 10];
        [self.setView updateWithItemModel:itemModel AtIndexPath:indexPath];
    }
}

/**
 返回tableHeaderView
 @param centerView pageScrollView description
 @return tableHeaderView
 */
- (UIView *)gxSettingCenterViewHeaderView:(CGXSettingCenterView *)centerView
{
    CustomHeaderView *ppView = [[CustomHeaderView alloc] init];
    ppView.backgroundColor = [UIColor orangeColor];
    ppView.frame = CGRectMake(0, 0, CGRectGetWidth(centerView.frame), 100);
    return ppView;
}
/**
 返回tableHeaderView
 @param centerView pageScrollView description
 @return tableHeaderView
 */
- (UIView *)gxSettingCenterViewFooterView:(CGXSettingCenterView *)centerView
{
    CustomFooterView *ppView = [[CustomFooterView alloc] init];
    ppView.backgroundColor = [UIColor orangeColor];
    ppView.frame = CGRectMake(0, 0, CGRectGetWidth(centerView.frame), 100);
    return ppView;
    
}
/**
 自定义cell
 @return UITableViewCell
 
 item。CGXSettingCenterSectionTypeCustom 有效
 */
- (UIView *)gxSettingCenterViewCellView:(CGXSettingCenterView *)centerView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGXSettingCenterSectionModel *sectionModel = centerView.dataArray[indexPath.section];
    CGXSettingCenterSectionItemModel *itemModel = sectionModel.rowArray[indexPath.row];
    
    CustomItemCellView  *itemCellView = [[CustomItemCellView alloc] init];
    
    [itemCellView updateCellWithSectionModel:sectionModel ItemModel:itemModel AtIndexPath:indexPath];
    
    // 计算高度的变化 改变
    itemModel.cellHeight = arc4random() % 50+60;
    [sectionModel.rowArray replaceObjectAtIndex:indexPath.row withObject:itemModel];
    [centerView.dataArray replaceObjectAtIndex:indexPath.section withObject:sectionModel];
    return itemCellView;
}

/**
 自定义头分区
 */
- (UIView *)gxSettingCenterViewCellView:(CGXSettingCenterView *)centerView
                        HeaderAtInSection:(NSInteger)section
{
    if (!self.isCustom) {
        CGXSettingCenterSectionModel *sectionModel = centerView.dataArray[section];
        sectionModel.headerHeight = 10;
        [centerView.dataArray replaceObjectAtIndex:section withObject:sectionModel];
        return nil;
    }
    CustomSectionHeaderView *view = [[CustomSectionHeaderView alloc] init];
    CGXSettingCenterSectionModel *sectionModel = centerView.dataArray[section];
    sectionModel.headerHeight = 40;
    [centerView.dataArray replaceObjectAtIndex:section withObject:sectionModel];
    [view updateSectionViewWithSectionModel:sectionModel AtInSection:section];
    return view;
}
/**
 自定义脚分区
 */
- (UIView *)gxSettingCenterViewCellView:(CGXSettingCenterView *)centerView
                        FooterAtInSection:(NSInteger)section
{
    if (!self.isCustom) {
        CGXSettingCenterSectionModel *sectionModel = centerView.dataArray[section];
        sectionModel.footerHeight = 10;
        [centerView.dataArray replaceObjectAtIndex:section withObject:sectionModel];
        return nil;
    }
    CustomSectionFooterView *view = [[CustomSectionFooterView alloc] init];
    CGXSettingCenterSectionModel *sectionModel = centerView.dataArray[section];
    sectionModel.footerHeight = 40;
    [centerView.dataArray replaceObjectAtIndex:section withObject:sectionModel];
    [view updateSectionViewWithSectionModel:sectionModel AtInSection:section];
    return view;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.setView.frame = self.view.bounds;
}
- (void)clickItemm:(UIBarButtonItem *)item
{
    self.isCustom = !self.isCustom;
    [self.setView.tableView reloadData];
}

@end
