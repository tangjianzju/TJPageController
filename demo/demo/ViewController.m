//
//  ViewController.m
//  demo
//
//  Created by lulul on 16/6/10.
//  Copyright © 2016年 TJPageController. All rights reserved.
//

#import "ViewController.h"
#import "TJPageViewController.h"

@interface ViewController ()<TJPageViewControllerPageChangedDelegate>

@property (strong, nonatomic) TJPageViewController *pageviewerController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pageChanged:(NSString *)tab {
    NSLog(@"%@", tab);
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.pageviewerController.view.frame = self.view.frame;
    //    self.button.frame = CGRectMake(60, 9, SCREENWIDTH - 120, 30);
}
- (IBAction)buttonClick:(id)sender {
    NSMutableArray *vcArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < 3; i++) {
        [vcArray addObject:[self generateTestViewController:i]];
    }
    
    TJPageViewController *pageviewerController = [[TJPageViewController alloc]init];
    pageviewerController.delegate = self;
    pageviewerController.titles = @[ @"标题1", @"标题2", @"标题3"];
    pageviewerController.controllers = vcArray;
    
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:pageviewerController];
    [self presentViewController:nc animated:YES completion:nil];
}

- (UIViewController *)generateTestViewController:(NSInteger)index {
    UIViewController *vc = [[UIViewController alloc]init];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    label.text = [NSString stringWithFormat:@"ViewController %ld", (long)index];
    [vc.view addSubview:label];
    return vc;
}

@end
