//
//  ViewController.m
//  xml
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "ViewController.h"
#import <XParser/XParser.h>
@interface ViewController ()
@property(nonatomic,nullable) UIView* xView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self load];
    
    NSLog(@"%@",[[UIColor alloc] initWithString: @"#abcdff12"]);
    
    NSLog(@"%@",NSStringFromCGRect(CGRectMake(0, 0, 100, 100)));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self load];
}


-(void) load{
    [self.xView removeFromSuperview];
    self.xView = [[XLayoutParser shared] parseLayout:@"/Users/knowchat02/Downloads/1/k.xml"];
    [self.view addSubview:self.xView];
}


@end
