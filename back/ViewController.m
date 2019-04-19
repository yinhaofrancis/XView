//
//  ViewController.m
//  xml
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "ViewController.h"
#import "XParser.h"
@interface ViewController ()
@property(nonatomic,nullable) UIView* xView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self load];
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self load];
}


-(void) load{
    [self.xView removeFromSuperview];
    self.xView =  (UIView*)[[[XParser alloc] initWithUrl:[NSURL fileURLWithPath:@"/Users/knowchat02/Downloads/1/k.xml"]] parse];
    [self.view addSubview:self.xView];
}

@end
