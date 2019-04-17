//
//  NSString+XString.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "NSString+XString.h"

@implementation NSString (XString)
- (NSString *)trimmingSpace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
- (NSString *)removeAllSpace{
    NSString *temp = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
}
- (BOOL)stringBoolValue{
    return [self.lowercaseString isEqualToString:@"true"];
}
@end
