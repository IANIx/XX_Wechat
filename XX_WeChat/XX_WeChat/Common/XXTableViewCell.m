//
//  XXTableViewCell.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/15.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXTableViewCell.h"

@interface XXTableViewCell ()

@property (nonatomic, strong) UIImageView   *imgTitle;
@property (nonatomic, strong) UILabel       *lblTitle;

@end

@implementation XXTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self.contentView addSubview:self.imgTitle];
    [self.imgTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(15.f);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.contentView addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imgTitle);
        make.left.equalTo(self.imgTitle.mas_right).with.offset(15.f);
    }];
}

- (void)settingData:(NSDictionary *)dic {
    self.imgTitle.image = [UIImage imageNamed:dic[@"image"]];
    self.lblTitle.text  = dic[@"title"];
}

#pragma mark - layzz
- (UIImageView *)imgTitle {
    if (_imgTitle == nil) {
        _imgTitle = [[UIImageView alloc]init];
    }
    return _imgTitle;
}
- (UILabel *)lblTitle {
    if (_lblTitle == nil) {
        _lblTitle = [[UILabel alloc]init];
        _lblTitle.font = [UIFont systemFontOfSize:15.f];
    }
    return _lblTitle;
}
@end
