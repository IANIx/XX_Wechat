//
//  XXCircleTableViewCell.h
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXCircleLayout.h"
@class XXCircleTableViewCell;
@interface  XXCircleTitleView: UIView

@property (nonatomic, strong) UIImageView *avatarImageView;//头像
@property (nonatomic,weak) XXCircleTableViewCell *cell;

@end

@interface XXCircleLinkView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic,weak) XXCircleTableViewCell *cell;

@end

@interface XXCircleImgView : UIView

@property (nonatomic, strong) NSArray<NSURL *>  *pics;

@end

@interface  XXCircleContentView: UIView
@property (nonatomic, strong) XXCircleLayout *layout;

@property (nonatomic, strong) UILabel *nickNameLabel;       //姓名
@property (nonatomic, strong) XXCircleImgView *imgView;     //显示图片
@property (nonatomic, strong) UILabel *contentLabel;        //内容
@property (nonatomic, strong) XXCircleLinkView *linkView;   //分享内容
@property (nonatomic, weak  ) XXCircleTableViewCell *cell;

@end


@interface  XXCircleToolsView: UIView

@property (nonatomic, strong) UILabel *timeLabel;       //时间
@property (nonatomic, strong) UIButton *commentButton;  //
@property (nonatomic,weak) XXCircleTableViewCell *cell;

@end

@interface  XXCommentTableViewCell : UITableViewCell

@property (nonatomic, strong) XXLabel *label;

@end

@interface  XXCircleCommentView: UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic,weak) XXCircleTableViewCell *cell;

@property (nonatomic, copy) NSArray *likes;
@property (nonatomic, copy) NSArray *comments;

@end

@interface XXStatusView : UIView

@property (nonatomic, strong) XXCircleTitleView *titleView;
@property (nonatomic, strong) XXCircleContentView *contentView;
@property (nonatomic, strong) XXCircleToolsView *toolView;
@property (nonatomic, strong) XXCircleCommentView *commentView;
@property (nonatomic,weak) XXCircleTableViewCell *cell;

@property (nonatomic, strong) XXCircleLayout *layout;
@end


@interface XXCircleTableViewCell : UITableViewCell
@property (nonatomic, strong) XXStatusView *statusView;

- (void)setLayout:(XXCircleLayout *)layout;
@end
