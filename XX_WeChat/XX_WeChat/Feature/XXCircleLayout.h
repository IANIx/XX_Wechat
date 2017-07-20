//
//  XXCircleLayout.h
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XXCircleitem.h"

#define CellTopMargin 8 //cell 顶部留白
#define CellBottomMargin 8
#define CellToolBarHeight 20.f

#define CellTextSize 15.f
#define kWBCellPadding 12       // cell 内边距
#define kCellContentPadding 8.f       

#define kWBCellContentWidth (MainScreenWidth - (2 * kWBCellPadding)) // cell 内容宽度
#define kWBCellPaddingPic 4     // cell 多张图片中间留白

@interface XXCircleLayout : NSObject
@property (nonatomic,strong) XXCircleitem *item;

// 总高度
@property (nonatomic, assign) CGFloat height;
// 顶部留白
@property (nonatomic, assign) CGFloat marginTop; //顶部灰色留白


// 个人资料
@property (nonatomic, assign) CGFloat profileHeight; //个人昵称

// 文本
@property (nonatomic, assign) CGFloat textHeight; //文本高度(包括下方留白)

// 图片
@property (nonatomic, assign) CGFloat picHeight; //图片高度，0为没图片
@property (nonatomic, assign) CGSize picSize;

@property (nonatomic, assign) CGFloat contentHeight;
// Tag
@property (nonatomic, assign) CGFloat tagHeight; //Tip高度，0为没tip

// 工具栏
@property (nonatomic, assign) CGFloat toolbarHeight; // 工具栏

// 评论
@property (nonatomic, assign) CGFloat interactionHeight;//评论和点赞

// 下边留白
@property (nonatomic, assign) CGFloat marginBottom; //下边留白

- (void)layout; ///< 计算布局

- (instancetype)initWithItem:(XXCircleitem *)item;
@end
