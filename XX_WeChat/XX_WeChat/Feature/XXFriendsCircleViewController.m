//
//  XXFriendsCircleViewController.m
//  XX_WeChat
//
//  Created by xuejiani on 2017/6/6.
//  Copyright © 2017年 IANI. All rights reserved.
//

#import "XXFriendsCircleViewController.h"
#import "XXCircleitem.h"
#import "XXCircleLayout.h"
#import "XXCircleTableViewCell.h"
@interface XXFriendsCircleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *layouts;

@property (nonatomic, strong) UIView *headerView;
@end

@implementation XXFriendsCircleViewController

- (instancetype)init {
    self = [super init];
    _layouts = @[].mutableCopy;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupText];
    [self loadSubViews];
    // Do any additional setup after loading the view.
}
- (void)setupText {
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"circleData" ofType:@"geojson"];
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[parseJason dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",array);
    for (int i = 0; i < array.count; i++) {
        XXCircleitem *item = [XXCircleitem yy_modelWithDictionary:array[i]];
        XXCircleLayout *layout = [[XXCircleLayout alloc]initWithItem:item];
        [_layouts addObject:layout];
    }
    
    NSLog(@"%@",array);
}
- (void)loadSubViews {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XXCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[XXCircleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
        //cell.delegate = self;
    }
    [cell setLayout:_layouts[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((XXCircleLayout *)_layouts[indexPath.row]).height;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 100)];
//    view.backgroundColor = [UIColor yellowColor];
//    
//    
//    
//    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(100, 85, 30, 30)];
//    image.backgroundColor = [UIColor redColor];
//    [view addSubview:image];
//    return view;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 100.f;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - lazy
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 100)];
        _headerView.backgroundColor = [UIColor yellowColor];
    }
    return _headerView;
}
@end
