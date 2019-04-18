//
//  UIView+XView.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "UIView+XView.h"
#import "UIColor+XColor.h"
#import "NSString+XString.h"
#import "UIImage+XImage.h"

CGRect XStringToRect(NSString* rectstr) {
    NSString* code  = [rectstr removeAllSpace];
    if ([code hasPrefix:@"{"] && [code hasSuffix:@"}"] && code.length >= 9){
        code = [rectstr substringWithRange:NSMakeRange(1, code.length - 2)];
        NSArray<NSString*> *codes = [code componentsSeparatedByString:@","];
        if(codes.count == 4){
            return CGRectMake(codes[0].doubleValue, codes[1].doubleValue, codes[2].doubleValue, codes[3].doubleValue);
        }else{
            return CGRectZero;
        }
    }else{
        return CGRectZero;
    }
}

CGSize XStringToSize(NSString* rectstr) {
    NSString* code  = [rectstr removeAllSpace];
    if ([code hasPrefix:@"{"] && [code hasSuffix:@"}"] && code.length >= 5){
        code = [rectstr substringWithRange:NSMakeRange(1, code.length - 2)];
        NSArray<NSString*> *codes = [code componentsSeparatedByString:@","];
        if(codes.count == 2){
            return CGSizeMake(codes[0].doubleValue, codes[1].doubleValue);
        }else{
            return CGSizeZero;
        }
    }else{
        return CGSizeZero;
    }
}


@implementation UIView (XView)
- (void)loadBackgroundColor:(NSString *)color {
    checkNil(color)
    self.backgroundColor = [[UIColor alloc] initWithString:color];
}
- (void)loadFrame:(NSString *)frame {
    checkNil(frame)
    self.frame = XStringToRect(frame);
}
- (void)loadCornerRadius:(NSString *)cornerRadius {
    checkNil(cornerRadius)
    self.layer.cornerRadius = cornerRadius.doubleValue;
}
- (void)loadContent:(NSString *)content {
    checkNil(content)
    self.layer.contents = (__bridge id _Nullable)([[UIImage alloc] initWithCode:content].CGImage);
}
- (void)loadShadowRadius:(NSString *)shadowRadius {
    checkNil(shadowRadius)
    self.layer.shadowRadius = shadowRadius.doubleValue;
}
- (void)loadShadowOffset:(NSString *)shadowOffset {
    checkNil(shadowOffset)
    self.layer.shadowOffset = XStringToSize(shadowOffset);
}
- (void)loadShadowColor:(NSString *)color {
    checkNil(color)
    self.layer.shadowColor = [[UIColor alloc] initWithString:color].CGColor;
}
- (void)loadShadowOpacity:(NSString *)Opacity {
    checkNil(Opacity)
    self.layer.shadowOpacity = Opacity.floatValue;
}
- (void)loadClipBound:(NSString *)flag{
    checkNil(flag)
    self.clipsToBounds = [flag stringBoolValue];
}
- (void)loadAttribute:(NSDictionary *)att{
    [self loadFrame:att[@"frame"]];
    [self loadBackgroundColor:att[@"backgroundColor"]];
    [self loadContent:att[@"content"]];
    [self loadCornerRadius:att[@"cornerRadius"]];
    [self loadClipBound:att[@"clipBound"]];
    [self loadShadowColor:att[@"shadowColor"]];
    [self loadShadowOffset:att[@"shadowOffset"]];
    [self loadShadowRadius:att[@"shadowRadius"]];
    [self loadShadowOpacity:att[@"shadowOpacity"]];
}
- (void)loadPropertyElement:(id<XElementLoader>)property{
    
}
- (void)completePropertyElement {
    
}
- (instancetype)initWithAttribute:(NSDictionary*)att{
    self = [self init];
    [self loadAttribute:att];
    return self;
}
@end
