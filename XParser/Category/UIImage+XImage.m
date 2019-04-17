//
//  UIImage+XImage.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "UIImage+XImage.h"

@implementation UIImage (XImage)
- (instancetype)initWithCode:(NSString*)code {
    switch ([self parseHeader:code]) {
        case ImageDataName:
            self = [UIImage imageNamed:[self parseName:code]];
            break;
        case ImageDataBlob:
            self = [self initWithData:[self parseBlob:code] scale:UIScreen.mainScreen.scale];
            break;
        case ImageDataAnimationName:
            self = [self parseAnimation:code];
            break;
        default:
            break;
    }
    return self;
}
- (ImageDataType)parseHeader:(NSString*)code{
    NSString* header = [code substringToIndex:2];
    if ([header isEqualToString:@"n:"]){
        return ImageDataName;
    }else if ([header isEqualToString:@"b:"]){
        return ImageDataBlob;
    }else if ([header isEqualToString:@"a:"]){
        return ImageDataAnimationName;
    }else{
        return ImageDataUnknown;
    }
}
- (NSString*)parseName:(NSString*)code{
    return [code substringFromIndex:2];
}

- (NSData*)parseBlob:(NSString*)code{
    NSString* datastr = [code substringFromIndex:2];
    return [[NSData alloc] initWithBase64EncodedString:datastr options:NSDataBase64DecodingIgnoreUnknownCharacters];
}
- (UIImage*)parseAnimation:(NSString*)code{
    NSString* datastr = [code substringFromIndex:2];
    NSArray<NSString*>* strs = [datastr componentsSeparatedByString:@"|"];
    if (strs.count >= 2){
        return [UIImage animatedImageNamed:strs[0] duration:strs[1].doubleValue];
    }else if(strs.count == 1){
        return [UIImage animatedImageNamed:strs[0] duration:1];
    }else{
        return nil;
    }
}

-(void)loadPropertyElement:(id<XElementLoader>)property {
    
}

- (void)loadAttribute:(NSDictionary *)att{
    
}
- (void)completePropertyElement{
    
}
- (instancetype)initWithAttribute:(NSDictionary *)att{
    return [self initWithCode:att[@"data"]];
}
@end
