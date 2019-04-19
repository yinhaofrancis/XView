//
//  UIFont+XFont.m
//  xml
//
//  Created by KnowChat02 on 2019/4/19.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "UIFont+XFont.h"

@implementation UIFont (XFont)
- (instancetype)initWithCode:(NSString*)code{
    NSArray<NSString*>* codes = [code componentsSeparatedByString:@"|"];
    if(codes.count > 1) {
        if([codes[1] isEqualToString:@"UltraLight"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightUltraLight];
        }
        if([codes[1] isEqualToString:@"Thin"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightThin];
        }
        if([codes[1] isEqualToString:@"Light"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightLight];
        }
        if([codes[1] isEqualToString:@"Regular"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightRegular];
        }
        if([codes[1] isEqualToString:@"Medium"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightMedium];
        }
        if([codes[1] isEqualToString:@"Semibold"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightSemibold];
        }
        if([codes[1] isEqualToString:@"Bold"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightBold];
        }
        if([codes[1] isEqualToString:@"Heavy"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightHeavy];
        }
        if([codes[1] isEqualToString:@"Black"]){
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:UIFontWeightBlack];
        }else{
            return [UIFont systemFontOfSize:codes[0].doubleValue weight:codes[1].doubleValue];
        }
        
    }else if (codes.count > 0) {
        return [UIFont systemFontOfSize:codes[0].doubleValue];
    }else{
        return nil;
    }
}
- (void)addChild:(nonnull id<XElement>)child {
    
}

- (void)completeChildParser {
    
}

- (nonnull instancetype)initWithName:(nonnull NSString *)name attribute:(nonnull NSDictionary *)att {
    return [UIFont systemFontOfSize:1];
}

- (void)loadAttribute:(nonnull NSString *)key value:(nonnull NSString *)value {
    
}


@dynamic name;
@dynamic attribute;
@dynamic children;
@dynamic elementAttribute;
@end
