//
//  UIColor+XColor.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "UIColor+XColor.h"
#import "NSString+XString.h"
@implementation UIColor (XColor)
- (instancetype)initWithString:(NSString *)code{
    NSString* processedCode = [code trimmingSpace];
    if([processedCode hasPrefix:@"#"]) {
        if(code.length == 4 || code.length == 7){
            NSArray<NSNumber *>* codes = [self seperate:code step:(code.length - 1) / 3];
            if(code.length == 4){
                return [self initWithRed:codes[0].doubleValue / 15 green:codes[1].doubleValue / 15 blue:codes[2].doubleValue / 15 alpha:1];
            }else{
                return [self initWithRed:codes[0].doubleValue / 255 green:codes[1].doubleValue / 255 blue:codes[2].doubleValue / 255 alpha:1];
            }
            
        } else if(code.length == 5 || code.length == 9){
            NSArray<NSNumber *>* codes = [self seperate:code step:(code.length - 1) / 4];
            
            if(code.length == 5){
                return [self initWithRed:codes[0].doubleValue / 15 green:codes[1].doubleValue / 15 blue:codes[2].doubleValue / 15 alpha:codes[3].doubleValue / 15];
            }else{
                return [self initWithRed:codes[0].doubleValue / 255 green:codes[1].doubleValue / 255 blue:codes[2].doubleValue / 255 alpha:codes[3].doubleValue / 255];
            }
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}
- (NSArray<NSNumber*> *)seperate:(NSString*)code step:(NSInteger)step{
    NSMutableArray<NSNumber* >* array = [[NSMutableArray alloc] init];
    for (int i = 1 ; i < code.length; i+= step) {
        NSRange rag = [code rangeOfComposedCharacterSequencesForRange:NSMakeRange(i, step)];
        NSString* str = [code substringWithRange:rag];
        NSScanner* scaner = [[NSScanner alloc] initWithString:str];
        uint num;
        [scaner scanHexInt:&num];
        [array addObject:@(num)];
    }
    return array;
}
@end
