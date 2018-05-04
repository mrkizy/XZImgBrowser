//
//  ViewController.m
//  XZImgBrowser
//
//  Created by zhi on 2018/5/4.
//  Copyright © 2018年 kizy. All rights reserved.
//

#import "ViewController.h"
#import "XZImgBrowser.h"

@interface ViewController ()
- (IBAction)btnOnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnOnClick:(UIButton *)sender {
    NSArray *array = @[self.img1, self.img2];
    [XZImgBrowser showViewWithArray:array beginWithIndex:0];
}
@end
