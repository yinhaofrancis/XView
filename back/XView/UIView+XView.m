//
//  UIView+XView.m
//  xml
//
//  Created by KnowChat02 on 2019/4/18.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "UIView+XView.h"
#import "UIColor+XColor.h"
#import "NSString+XString.h"
#import "UIImage+XImage.h"
#import <objc/runtime.h>
#import "XValue.h"
#define kName "name"

#define kAttribute "attribute"

#define kElementAttribute "elementAttribute"

@implementation UIView (XView)


- (void)addChild:(nonnull id<XElement>)child {
    if([child isKindOfClass:UIView.class]){
        [self addSubview:(UIView*)child];
    }else{
        [((NSMutableArray*)objc_getAssociatedObject(self, kElementAttribute)) addObject:child];
    }
}

- (void)completeChildParser {
    
}

- (nonnull instancetype)initWithName:(nonnull NSString *)name attribute:(nonnull NSDictionary *)att {
    self = [self init];
    if(self){
        objc_setAssociatedObject(self, kAttribute, att, OBJC_ASSOCIATION_COPY_NONATOMIC);
        objc_setAssociatedObject(self, kName, name, OBJC_ASSOCIATION_COPY);
        objc_setAssociatedObject(self, kElementAttribute, NSMutableArray.new, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        for (NSString *i in att.allKeys) {
            [self loadAttribute:i value:att[i]];
        }
    }
    return self;
}
-(NSDictionary *)attribute{
    return objc_getAssociatedObject(self, kAttribute);
}

- (NSString *)name{
    return objc_getAssociatedObject(self, kName);
}
- (NSArray<id<XElement>> *)children{
    return self.subviews;
}
- (NSArray<id<XElement>> *)elementAttribute{
    return objc_getAssociatedObject(self, kElementAttribute);
}
- (void)loadAttribute:(NSString *)key value:(NSString*)value{
    if ([key isEqualToString:@"backgroundColor"]){
        self.backgroundColor = [[UIColor alloc] initWithCode:value];
    }
    if ([key isEqualToString:@"frame"]){
        self.frame = XStringToRect(value);
    }
    if ([key isEqualToString:@"content"]){
        self.layer.contents = (__bridge id _Nullable)([[UIImage alloc] initWithCode:value].CGImage);
    }
    if ([key isEqualToString:@"frame"]){
        self.frame = XStringToRect(value);
    }
    if ([key isEqualToString:@"cornerRadius"]){
        self.layer.cornerRadius = value.doubleValue;
    }
    if ([key isEqualToString:@"clipBound"]){
        self.clipsToBounds = [value stringBoolValue];
    }
    if ([key isEqualToString:@"shadowColor"]) {
        self.layer.shadowColor = [[UIColor alloc] initWithCode:value].CGColor;
    }
    if ([key isEqualToString:@"shadowOffset"]) {
        self.layer.shadowOffset = XStringToSize(value);
    }
    if ([key isEqualToString:@"shadowRadius"]) {
        self.layer.shadowRadius = value.doubleValue;
    }
    if ([key isEqualToString:@"shadowOpacity"]) {
        self.layer.shadowOpacity = value.doubleValue;
    }    
}
@end
