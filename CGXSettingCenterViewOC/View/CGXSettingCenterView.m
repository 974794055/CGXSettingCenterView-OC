//
//  CGXSettingCenterView.m
//  CGXSettingCenterView-OC
//
//  Created by CGX on 2021/07/10.
//  Copyright © 2018 CGX. All rights reserved.
//

#import "CGXSettingCenterView.h"
#import "CGXSettingCenterBaseCell.h"
#import "CGXSettingCenterSwitchCell.h"
#import "CGXSettingCenterArrowCell.h"
#import "CGXSettingCenterTextCell.h"
#import "CGXSettingCenterImageCell.h"

#import "CGXSettingCenterTitleCell.h"
#import "CGXSettingCenterCustomCell.h"
#import "CGXSettingCenterHeaderView.h"
#import "CGXSettingCenterFooterView.h"
@interface CGXSettingCenterView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong,readwrite) UITableView *tableView;
@property (nonatomic, strong,readwrite) NSMutableArray<CGXSettingCenterSectionModel *> *dataArray;
@end
@implementation CGXSettingCenterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = [NSMutableArray array];
        self.showsVerticalScrollIndicator = NO;
        self.tableView= ({
            UITableView *ppTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
            ppTableView.delegate = self;
            ppTableView.dataSource = self;
            ppTableView.alwaysBounceVertical = YES;
            ppTableView.showsHorizontalScrollIndicator = NO;
            ppTableView.showsVerticalScrollIndicator = NO;
            ppTableView.scrollEnabled = YES;
            ppTableView.bounces = YES;
            ppTableView.backgroundColor = [UIColor clearColor];
            ppTableView.estimatedRowHeight = 0;
            ppTableView.estimatedSectionFooterHeight= 0;
            ppTableView.estimatedSectionHeaderHeight= 0;
            [ppTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            [ppTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
            [ppTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
            if (@available(iOS 11.0, *)) {
                ppTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
            ppTableView.estimatedSectionHeaderHeight = 0;
            ppTableView.estimatedSectionFooterHeight = 0;
            ppTableView;
        });
        [self addSubview:self.tableView];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [self.tableView registerClass:[CGXSettingCenterBaseCell class] forCellReuseIdentifier:NSStringFromClass([CGXSettingCenterBaseCell class])];
        [self.tableView registerClass:[CGXSettingCenterSwitchCell class] forCellReuseIdentifier:NSStringFromClass([CGXSettingCenterSwitchCell class])];
        [self.tableView registerClass:[CGXSettingCenterArrowCell class] forCellReuseIdentifier:NSStringFromClass([CGXSettingCenterArrowCell class])];
        [self.tableView registerClass:[CGXSettingCenterTextCell class] forCellReuseIdentifier:NSStringFromClass([CGXSettingCenterTextCell class])];
        [self.tableView registerClass:[CGXSettingCenterImageCell class] forCellReuseIdentifier:NSStringFromClass([CGXSettingCenterImageCell class])];
        [self.tableView registerClass:[CGXSettingCenterTitleCell class] forCellReuseIdentifier:NSStringFromClass([CGXSettingCenterTitleCell class])];
        [self.tableView registerClass:[CGXSettingCenterCustomCell class] forCellReuseIdentifier:NSStringFromClass([CGXSettingCenterCustomCell class])];
        
        [self.tableView registerClass:[CGXSettingCenterFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([CGXSettingCenterFooterView class])];
        [self.tableView registerClass:[CGXSettingCenterHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([CGXSettingCenterHeaderView class])];
        
        CGFloat bottom = [[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 34:0;
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, bottom, 0);
    }
    return self;
}
-(void)tap{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
{
    _showsVerticalScrollIndicator = showsVerticalScrollIndicator;
    self.tableView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame  = self.bounds;
    [self.tableView reloadData];
}
#pragma mark tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CGXSettingCenterSectionModel *sectionModel = self.dataArray[section];
    return sectionModel.rowArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGXSettingCenterSectionModel *sectionModel = self.dataArray[section];
    if (self.delegate && [self.delegate respondsToSelector:@selector(gxSettingCenterViewCellView:FooterAtInSection:)] && [self.delegate gxSettingCenterViewCellView:self FooterAtInSection:section]) {
        return MAX(sectionModel.footerHeight,0.01);
    }
    if (sectionModel.footerModel.text.length == 0 && sectionModel.footerModel.textAttring == 0) {
        return MAX(sectionModel.footerHeight,0.01);
    }
    NSMutableAttributedString *textAttributeStr = [CGXSettingCenterTools updateTextLeftModel:sectionModel.footerModel];
    if (sectionModel.footerModel.textAttring && sectionModel.footerModel.textAttring > 0) {
        textAttributeStr = sectionModel.footerModel.textAttring;
    }
    [textAttributeStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    CGSize size = [textAttributeStr boundingRectWithSize:CGSizeMake(CGRectGetWidth(tableView.frame)-sectionModel.footerModel.textSpaceRight-sectionModel.footerModel.textSpaceLeft, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading context:nil].size;
    if (size.height> sectionModel.footerHeight) {
        sectionModel.footerHeight = size.height;
        [self.dataArray replaceObjectAtIndex:section withObject:sectionModel];
    }
    return MAX(sectionModel.footerHeight,0.01);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGXSettingCenterSectionModel *sectionModel = self.dataArray[section];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(gxSettingCenterViewCellView:HeaderAtInSection:)] && [self.delegate gxSettingCenterViewCellView:self HeaderAtInSection:section]) {
        return MAX(sectionModel.headerHeight,0.01);
    }
    if (sectionModel.headerModel.text.length == 0 && sectionModel.headerModel.textAttring == 0) {
        return MAX(sectionModel.headerHeight,0.01);
    }
    NSMutableAttributedString *textAttributeStr = [CGXSettingCenterTools updateTextLeftModel:sectionModel.headerModel];
    if (sectionModel.headerModel.textAttring && sectionModel.headerModel.textAttring > 0) {
        textAttributeStr = sectionModel.headerModel.textAttring;
    }
    [textAttributeStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    CGSize size = [textAttributeStr boundingRectWithSize:CGSizeMake(CGRectGetWidth(tableView.frame)-sectionModel.headerModel.textSpaceRight-sectionModel.headerModel.textSpaceLeft, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading context:nil].size;
    if (size.height> sectionModel.headerHeight) {
        sectionModel.headerHeight = size.height;
        [self.dataArray replaceObjectAtIndex:section withObject:sectionModel];
    }
    return MAX(sectionModel.headerHeight,0.01);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGXSettingCenterSectionModel *sectionModel = self.dataArray[indexPath.section];
    CGXSettingCenterSectionItemModel *itemModel = sectionModel.rowArray[indexPath.row];
    if (itemModel.isHiddenCell) {
        return 0;
    }
    if (itemModel.sectionType == CGXSettingCenterSectionTypeHeader ||
        itemModel.sectionType == CGXSettingCenterSectionTypeTitle ||
        itemModel.sectionType == CGXSettingCenterSectionTypeNode ||
        itemModel.sectionType == CGXSettingCenterSectionTypeCustom) {
        return MAX(itemModel.cellHeight,44);
    }
    CGFloat itemSizeHeight = itemModel.cellHeight;
    NSMutableAttributedString *textAttributeStr = [CGXSettingCenterTools updateTextLeftModel:itemModel.nameModel];
    if (itemModel.nameModel.textAttring && itemModel.nameModel.textAttring > 0) {
        textAttributeStr = itemModel.nameModel.textAttring;
    }
    itemSizeHeight = [textAttributeStr boundingRectWithSize:CGSizeMake(CGRectGetWidth(tableView.frame)*itemModel.nameMacWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading context:nil].size.height;
    if (itemSizeHeight+20> itemModel.cellHeight) {
        itemModel.cellHeight = itemSizeHeight+20;
        [sectionModel.rowArray replaceObjectAtIndex:indexPath.row withObject:itemModel];
        [self.dataArray replaceObjectAtIndex:indexPath.section withObject:sectionModel];
    }
    return MAX(itemModel.cellHeight,44);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGXSettingCenterSectionModel *sectionModel = self.dataArray[section];
    CGXSettingCenterHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([CGXSettingCenterHeaderView class])];
    if (headerView == nil) {
        headerView = [[CGXSettingCenterHeaderView alloc] initWithReuseIdentifier:NSStringFromClass([CGXSettingCenterHeaderView class])];
    }
    headerView.contentView.backgroundColor = sectionModel.headerBgColor;
    [headerView.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == 10000) {
            [obj removeFromSuperview];
        }
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(gxSettingCenterViewCellView:HeaderAtInSection:)] && [self.delegate gxSettingCenterViewCellView:self HeaderAtInSection:section]) {
        headerView.titleLabel.hidden = YES;
        UIView *customView = [self.delegate gxSettingCenterViewCellView:self HeaderAtInSection:section];
        customView.frame = CGRectMake(0, 0, CGRectGetWidth(tableView.frame), sectionModel.headerHeight);
        customView.tag = 10000;
        [headerView.contentView addSubview:customView];
        customView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:headerView.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:headerView.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:headerView.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:headerView.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
        [headerView.contentView addConstraints:@[top, leading, bottom, trailing]];
    } else{
        headerView.titleLabel.hidden = NO;
        [headerView updateHeaderViewWithSectionModel:sectionModel AtInSection:section];
        
        
    }
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGXSettingCenterSectionModel *sectionModel = self.dataArray[section];
    CGXSettingCenterFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([CGXSettingCenterFooterView class])];
    if (footerView == nil) {
        footerView = [[CGXSettingCenterFooterView alloc] initWithReuseIdentifier:NSStringFromClass([CGXSettingCenterFooterView class])];
    }
    footerView.contentView.backgroundColor = sectionModel.footerBgColor;
    [footerView.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == 10000) {
            [obj removeFromSuperview];
        }
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(gxSettingCenterViewCellView:FooterAtInSection:)] && [self.delegate gxSettingCenterViewCellView:self FooterAtInSection:section]) {
        footerView.titleLabel.hidden = YES;
        UIView *customView = [self.delegate gxSettingCenterViewCellView:self FooterAtInSection:section];
        customView.frame = footerView.contentView.bounds;
        customView.tag = 10000;
        [footerView.contentView addSubview:customView];
        customView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:footerView.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:footerView.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:footerView.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:footerView.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
        [footerView.contentView addConstraints:@[top, leading, bottom, trailing]];
    } else{
        footerView.titleLabel.hidden = NO;
        [footerView updateSectionViewWithSectionModel:sectionModel AtInSection:section];
    }
    return footerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGXSettingCenterSectionModel *sectionModel = self.dataArray[indexPath.section];
    CGXSettingCenterSectionItemModel *itemModel = sectionModel.rowArray[indexPath.row];
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:itemModel.cellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = itemModel.cellColor;
    
    if (itemModel.sectionType == CGXSettingCenterSectionTypeCustom) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(gxSettingCenterViewCellView:cellForRowAtIndexPath:)] && [self.delegate gxSettingCenterViewCellView:self cellForRowAtIndexPath:indexPath]) {
            [cell.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj removeFromSuperview];
            }];
            UIView *customView = [self.delegate gxSettingCenterViewCellView:self cellForRowAtIndexPath:indexPath];
            customView.frame = cell.contentView.bounds;
            [cell.contentView addSubview:customView];
            customView.translatesAutoresizingMaskIntoConstraints = NO;
            NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
            NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
            NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
            NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
            [cell.contentView addConstraints:@[top, leading, bottom, trailing]];
        }
    } else{
        BOOL isHave = [cell respondsToSelector:@selector(updateCellWithSectionModel:ItemModel:AtIndexPath:)];
        if (isHave == YES && [cell conformsToProtocol:@protocol(CGXSettingCenterCellDelegate)]) {
            [(UITableViewCell<CGXSettingCenterCellDelegate> *)cell updateCellWithSectionModel:sectionModel ItemModel:itemModel AtIndexPath:indexPath];
        }
        __weak typeof(self) weakSelf = self;
        if ([cell isKindOfClass:[CGXSettingCenterSwitchCell class]]) {
            CGXSettingCenterSwitchCell *switchCell = (CGXSettingCenterSwitchCell *)cell;
            switchCell.switchValueChanged = ^(BOOL isOn, CGXSettingCenterSectionItemModel * _Nonnull itemM) {
                itemM.switchOpen = isOn;
                [sectionModel.rowArray replaceObjectAtIndex:indexPath.row withObject:itemM];
                [weakSelf.dataArray replaceObjectAtIndex:indexPath.section withObject:sectionModel];
                if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(gxSettingCenterView:didSelectRowAtIndexPath:ItemModel:)]) {
                    [weakSelf.delegate gxSettingCenterView:weakSelf didSelectRowAtIndexPath:indexPath ItemModel:itemM];
                }
            };
        }
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGXSettingCenterSectionModel *sectionModel = self.dataArray[indexPath.section];
    CGXSettingCenterSectionItemModel *itemModel = sectionModel.rowArray[indexPath.row];
    if (itemModel.sectionType == CGXSettingCenterSectionTypeNode ||
        itemModel.sectionType == CGXSettingCenterSectionTypeSwitch) {
        return;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(gxSettingCenterView:didSelectRowAtIndexPath:ItemModel:)]) {
        [self.delegate gxSettingCenterView:self didSelectRowAtIndexPath:indexPath ItemModel:itemModel];
    }
}

- (void)updateWithDataArray:(NSMutableArray<CGXSettingCenterSectionModel *> *)dataArray
{
    [self.dataArray removeAllObjects];
    for (CGXSettingCenterSectionModel *sectionModel in dataArray) {
        [self.dataArray addObject:sectionModel];
    }
    [self.tableView reloadData];
}
// 更新某个item
- (void)updateWithItemModel:(CGXSettingCenterSectionItemModel *)itemModel AtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataArray.count == 0) {
        return;
    }
    if (indexPath.section>self.dataArray.count-1) {
        return;
    }
    for (int i = 0; i<self.dataArray.count; i++) {
        CGXSettingCenterSectionModel *sectionModel = self.dataArray[i];
        for (int j = 0; j<sectionModel.rowArray.count; j++) {
            if (indexPath.section == i && indexPath.row == j) {
                if (itemModel) {
                    [sectionModel.rowArray replaceObjectAtIndex:indexPath.row withObject:itemModel];
                    [self.tableView reloadData];
                }
                break;;
            }
        }
    }
}
- (void)updateWithTableHeaderView
{
    CGFloat headHeight = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(gxSettingCenterViewHeaderView:)] && [self.delegate gxSettingCenterViewHeaderView:self]) {
        UIView *tableHeaderView = [self.delegate gxSettingCenterViewHeaderView:self];
        headHeight = tableHeaderView.frame.size.height;
        UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, headHeight)];
        [containerView addSubview:tableHeaderView];
        tableHeaderView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:tableHeaderView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:tableHeaderView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:tableHeaderView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:tableHeaderView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
        [containerView addConstraints:@[top, leading, bottom, trailing]];
        self.tableView.tableHeaderView = containerView;
    }
}
- (void)updateWithTableFooterView
{
    CGFloat headHeight = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(gxSettingCenterViewFooterView:)] && [self.delegate gxSettingCenterViewFooterView:self]) {
        UIView *tableFooterView = [self.delegate gxSettingCenterViewFooterView:self];
        headHeight = tableFooterView.frame.size.height;
        UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, headHeight)];
        [containerView addSubview:tableFooterView];
        tableFooterView.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:tableFooterView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:tableFooterView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:tableFooterView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:tableFooterView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
        [containerView addConstraints:@[top, leading, bottom, trailing]];
        self.tableView.tableFooterView = containerView;
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end



