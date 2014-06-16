//
//  MainViewController.m
//  关灯游戏1.0
//
//  Created by 萨斯辈的呼唤 on 14-6-11.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import "MainViewController.h"

int a[3][3];

void check(int *number)
{
    if (*number == 1) {
        *number = 0;
    }
    if (*number == 0) {
        *number = 1;
    }
}

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.array = [NSMutableArray array];
        NSMutableArray *temp = [NSMutableArray array];
        for (int i = 0; i < 9; i ++) {
            [temp addObject:@"1"];
        }
        self.array = [[NSArray alloc] initWithArray:temp];
        for (int i = 0 ; i < 3; i ++) {
            for (int j = 0; j < 3; j ++) {
                a[i][j] = 1;
            }
        }
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buttonView = [[BtnView alloc] initWithFrame:CGRectMake(0, 0, 320, 568) array:self.array];
    [self.view addSubview:self.buttonView];
    self.buttonView.target = self;
    self.buttonView.action = @selector(changeValue:);
}

- (void)changeValue:(NSString *)index
{
// 处理点击点 以及周围点的变化
    int number = [index intValue] - 10000;
//    NSLog(@"%d", number);
    int x = number / 3;
    int y = number % 3;
//    NSLog(@"%d %d", x, y);
    if (a[x][y] == 0) {
        a[x][y] = 1;
    } else {
        a[x][y] = 0;
    }
    if (x - 1 >= 0) {
//        NSLog(@"下");
        if (a[x - 1][y] == 0) {
            a[x - 1][y] = 1;
        } else {
            a[x - 1][y] = 0;
        }
    }
    if (x + 1 < 3) {
//        NSLog(@"上");
        if (a[x + 1][y] == 0) {
            a[x + 1][y] = 1;
        } else {
            a[x + 1][y] = 0;
        }
    }
    if (y + 1 < 3) {
//        NSLog(@"右");
        if (a[x][y + 1] == 0) {
            a[x][y + 1] = 1;
        } else {
            a[x][y + 1] = 0;
        }
    }
    if (y - 1 >= 0) {
//        NSLog(@"左");
        if (a[x][y - 1] == 0) {
//            NSLog(@"=====");
            a[x][y - 1] = 1;
        } else {
//            NSLog(@"+++++");
            a[x][y - 1] = 0;
        }
    }

    
    NSMutableArray *temp = [NSMutableArray array];

    for (int i = 0 ; i < 3; i ++) {
        for (int j = 0; j < 3; j ++) {
            [temp addObject:[NSString stringWithFormat:@"%d", a[i][j]]];
        }
    }
    
    
    self.array = temp;
    
    [self.buttonView changeViewColor:self.array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
