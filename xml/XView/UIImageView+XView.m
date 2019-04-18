//
//  UIImageView+XView.m
//  xml
//
//  Created by KnowChat02 on 2019/4/18.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "UIImageView+XView.h"
#import "UIView+XView.h"
#import "UIImage+XImage.h"
@implementation UIImageView (XView)


- (void)loadAttribute:(nonnull NSString *)key value:(NSString*)value {
    [super loadAttribute:key value:value];
    if([key isEqualToString:@"image"]){
        self.image = [[UIImage alloc] initWithCode:value];
    }
}


@end
