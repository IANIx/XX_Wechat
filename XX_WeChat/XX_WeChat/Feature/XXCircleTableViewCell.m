//
//  XXCircleTableViewCell.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXCircleTableViewCell.h"




@implementation XXCircleTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _avatarImageView = [[UIImageView alloc]init];
        _avatarImageView.backgroundColor = [UIColor grayColor];
        [self addSubview:_avatarImageView];
        [_avatarImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self);
        }];
    }
    return self;
}

@end

@implementation XXCircleLinkView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end

@implementation XXCircleImgView


@end
@implementation XXCircleContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _nickNameLabel = [[UILabel alloc]init];
        _nickNameLabel.font = [UIFont boldSystemFontOfSize:CellTextSize];
        [self addSubview:_nickNameLabel];
        
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:CellTextSize];
        [self addSubview:_contentLabel];
        
        _imgView = [[XXCircleImgView alloc]init];
        _imgView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_imgView];
        
        _linkView = [[XXCircleLinkView alloc]init];
        [self addSubview:_linkView];
    }
    return self;
}

- (void)setLayout:(XXCircleLayout *)layout {
    _layout = layout;
    _nickNameLabel.text = layout.item.user.nickname;
    _contentLabel.text = layout.item.text;
    _imgView.pics = layout.item.pics;
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.height.mas_equalTo(layout.profileHeight);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.nickNameLabel.mas_bottom).with.mas_equalTo(kCellContentPadding);
        make.height.mas_equalTo(layout.textHeight);
    }];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.contentLabel.mas_bottom).with.mas_equalTo(kCellContentPadding);
        make.height.mas_equalTo(layout.picHeight);
    }];
//    [_linkView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
}
@end

@implementation XXCircleToolsView 

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.left.equalTo(self);
        }];
        
        [self addSubview:self.commentButton];
        [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.width.equalTo(self.commentButton.mas_height);
        }];
    }
    return self;
}
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:9.f];
        _timeLabel.textColor = [UIColor grayColor];
    }
    return _timeLabel;
}
- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentButton setBackgroundImage:[UIImage imageNamed:@"AlbumOperateMore"] forState:UIControlStateNormal];
    }
    return _commentButton;
}
@end

@implementation XXCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _label = [[XXLabel alloc]init];
    [self addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.equalTo(self);
    }];
    
    return self;
}
- (void)settingDataWithLikes:(NSArray<XXCircleUser *> *)likes comments:(NSArray<XXCircleComment *> *)comments cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSMutableArray *userArray = @[].mutableCopy;
        [likes enumerateObjectsUsingBlock:^(XXCircleUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [userArray addObject:obj.nickname];
        }];
    } else {
        
    }
}
@end

@implementation XXCircleCommentView 

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _tabelView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
        [self addSubview:_tabelView];
    }
    return self;
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? _likes.count : _comments.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.000001f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XXCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[XXCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    [cell settingDataWithLikes:_likes comments:_comments cellForRowAtIndexPath:indexPath];
    return cell;
}
@end

@implementation XXStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(CellTopMargin);
        make.left.mas_equalTo(kWBCellPadding);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView);
        make.left.equalTo(self.titleView.mas_right).with.offset(kWBCellPadding);
        make.right.equalTo(self).with.offset(-kWBCellPadding);
    }];

    [self addSubview:self.toolView];
    [self.toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_bottom);
        make.right.equalTo(self).with.offset(-kCellContentPadding);
    }];
    
    [self addSubview:self.commentView];
    [self.commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.toolView);
        make.top.equalTo(self.toolView.mas_bottom);
    }];
    return self;
}
- (void)setLayout:(XXCircleLayout *)layout {
    _layout = layout;
    
    [self.titleView.avatarImageView sd_setImageWithURL:[NSURL URLWithString:layout.item.user.icon_url]];
    
    self.contentView.layout = layout;
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(layout.contentHeight);
    }];
    
    self.toolView.timeLabel.text = layout.item.create_time;
    [self.toolView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(layout.toolbarHeight);
    }];
    
    if (layout.item.likes.count > 0 || layout.item.comments > 0) {
        [self.commentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(layout.interactionHeight);
        }];
    } else {
        [self.commentView removeFromSuperview];
    }
}

#pragma mark - layz
- (XXCircleTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[XXCircleTitleView alloc]init];
    }
    return _titleView;
}
- (XXCircleContentView *)contentView {
    if (!_contentView) {
        _contentView = [[XXCircleContentView alloc]init];
        _contentView.backgroundColor = [UIColor yellowColor];
    }
    return _contentView;
}
- (XXCircleToolsView *)toolView {
    if (!_toolView) {
        _toolView = [[XXCircleToolsView alloc]init];
        _toolView.backgroundColor = [UIColor cyanColor];
    }
    return _toolView;
}
- (XXCircleCommentView *)commentView {
    if (!_commentView) {
        _commentView = [[XXCircleCommentView alloc]init];
        _commentView.backgroundColor = [UIColor purpleColor];
    }
    return _commentView;
}
@end

@implementation XXCircleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _statusView = [XXStatusView new];
    _statusView.cell = self;
    _statusView.titleView.cell = self;
    _statusView.contentView.cell = self;
    _statusView.toolView.cell = self;
    _statusView.commentView.cell = self;
    [self.contentView addSubview:_statusView];
    [_statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setLayout:(XXCircleLayout *)layout {
    _statusView.layout = layout;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
