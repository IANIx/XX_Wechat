//
//  XX_ActionSheet.h
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/31.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XX_ActionSheetDelegate;

typedef void(^ClickedIndexBlock)(NSInteger index);

@interface XX_ActionSheet : UIView
@property (weak,nonatomic) id<XX_ActionSheetDelegate> delegate;
@property (strong,nonatomic) NSString *titleText;
@property (strong,nonatomic) NSString *cancelText;


/**
 *  @brief 初始化XX_ActionSheet
 *
 *  @param title                  ActionSheet标题
 *  @param delegate               委托
 *  @param cancelButtonTitle      取消按钮标题
 *  @param otherButtonTitles      其他按钮标题
 *
 *  @return XX_ActionSheet
 */
- (instancetype)initWithTitle:(NSString *)title
                     delegate:(id<XX_ActionSheetDelegate>)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...;



/**
 *  @brief 初始化XX_ActionSheet(Block回调结果)
 *
 *  @param title             ActionSheet标题
 *  @param block             Block回调选中的Index
 *  @param cancelButtonTitle 取消按钮标题
 *  @param otherButtonTitles 其他按钮标题
 *
 *  @return XX_ActionSheet
 */
- (instancetype)initWithTitle:(NSString *)title
               clickedAtIndex:(ClickedIndexBlock)block
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...;



/**
 *  @brief 显示ActionSheet
 */
- (void)show;

/**
 *  @brief 添加按钮
 *
 *  @param title 按钮标题
 *
 *  @return 按钮的Index
 */
- (NSInteger)addButtonWithTitle:(NSString *)title;

@end

@protocol XX_ActionSheetDelegate <NSObject>

@optional

/**
 *  @brief 被选中的按钮
 *
 *  @param actionSheet XX_ActionSheet
 *  @param buttonIndex 选中按钮的Index(取消按钮默认为最后一个按钮)
 */
- (void)actionSheet:(XX_ActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex;


/**
 *  @brief XX_ActionSheet将要显示
 *
 *  @param actionSheet XX_ActionSheet
 */
- (void)willPresentActionSheet:(XX_ActionSheet *)actionSheet;

/**
 *  @brief XX_ActionSheet已经显示
 *
 *  @param actionSheet XX_ActionSheet
 */
- (void)didPresentActionSheet:(XX_ActionSheet *)actionSheet;


@end
