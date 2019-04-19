//
//  XValue.c
//  xml
//
//  Created by KnowChat02 on 2019/4/18.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#include "XValue.h"
#import "NSString+XString.h"

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
