//
//  XXCircleTableViewCell.h
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface  XXCircleTitleView: UIView

@property (nonatomic, strong) UIImageView *avatarImageView;//头像

@end

@interface XXCircleLinkView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@interface  XXCircleContentView: UIView

@property (nonatomic, strong) UILabel *nickNameLabel;       //姓名
@property (nonatomic, strong) UILabel *contentLabel;        //内容
@property (nonatomic, strong) XXCircleLinkView *linkView;   //分享内容

@end


@interface  XXCircleToolsView: UIView

@property (nonatomic, strong) UILabel *timeLabel;       //时间
@property (nonatomic, strong) UIButton *commentButton;  //

@end

@interface  XXCircleCommentView: UIView

@end

@interface XXCircleTableViewCell : UITableViewCell

@end
