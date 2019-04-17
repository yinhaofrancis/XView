//
//  UIImageView+XImageView.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "XImageView.h"
#import "UIImage+XImage.h"
#import "XImageAnimation.h"
@implementation XImageView

-(void)loadPropertyElement:(id<XElementLoader>)property{
    [super loadPropertyElement:property];
    if([property isKindOfClass:[XImageAnimation class]]){
        self.imageAnimation = property;
    }
}
- (void)completePropertyElement{
    self.animationImages = self.imageAnimation.images;
    self.animationDuration = self.imageAnimation.during;
    self.animationRepeatCount = self.imageAnimation.repeat;
    [self startAnimating];
}

@end
