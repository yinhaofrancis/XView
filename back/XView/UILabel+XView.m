//
//  UILabel+XView.m
//  xml
//
//  Created by KnowChat02 on 2019/4/19.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "UILabel+XView.h"
#import "UIView+XView.h"

NSTextAlignment XTextAlignment(NSString* str){
    if([str isEqualToString:@"left"]){
        return NSTextAlignmentLeft;
    }
    if([str isEqualToString:@"center"]){
        return NSTextAlignmentCenter;
    }
    if([str isEqualToString:@"right"]){
        return NSTextAlignmentRight;
    }
    if([str isEqualToString:@"Justified"]){
        return NSTextAlignmentJustified;
    }
    return NSTextAlignmentNatural;
    
}

@implementation UILabel (XView)
- (void)loadAttribute:(nonnull NSString *)key value:(NSString*)value {
    [super loadAttribute:key value:value];
    if([key isEqualToString:@"text"]){
        self.text = value;
    }
    if([key isEqualToString:@"textAlign"]){
        self.textAlignment = XTextAlignment(value);
    }
    if([key isEqualToString:@"fontSize"]){
        self.font = [UIFont systemFontOfSize:value.doubleValue];
    }
    if([key isEqualToString:@"boldFontSize"]){
        self.font = [UIFont boldSystemFontOfSize:value.doubleValue];
    }
}
@end
