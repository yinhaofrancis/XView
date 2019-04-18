//
//  UIImageView+XView.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "UIImageView+XView.h"
#import "UIView+XView.h"
#import "UIImage+XImage.h"
@implementation UIImageView (XView)
- (void)loadAttribute:(NSDictionary *)att{
    [super loadAttribute:att];
    [self loadImage:att[@"image"]];
}
- (void)loadImage:(NSString *)content {
    checkNil(content)
    self.image = [[UIImage alloc]initWithCode:content];
}

- (void)loadAnimationImage:(NSString *)name {
    checkNil(name)
  
}
@end
