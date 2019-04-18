//
//  XImageAnimation.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "XImageAnimation.h"
#import "NSString+XString.h"
@implementation XImageAnimation{
    NSMutableArray* array;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        array = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)loadAttribute:(nonnull NSDictionary *)att {
    [self loadDuring:att[@"during"]];
    [self loadRepeat:att[@"repeat"]];
}

- (void)loadPropertyElement:(nonnull id<XElementLoader>)property {
    [array addObject:property];
}

- (nonnull instancetype)initWithAttribute:(nonnull NSDictionary *)att {
    self = [self init];
    [self loadAttribute:att];
    return self;
}

- (void)loadDuring:(NSString*)during{
    checkNil(during)
    self.during = during.doubleValue;
}
- (void)loadRepeat:(NSString*)repeat{
    checkNil(repeat)
    self.repeat = [repeat integerValue];
}
- (NSArray<UIImage *> *)images{
    return array;
}
- (void)completePropertyElement{
    
}
@end
