//
//  XProperty.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "XProperty.h"

@implementation XProperty{
    NSMutableArray* sub;
    NSDictionary* att;
}
- (instancetype)initWithName:(NSString*)name {
    self = [super init];
    if (self) {
        sub = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)addSubProperty:(XProperty*)pro{
    [sub addObject:pro];
}
- (NSArray *)subProperty{
    return sub.copy;
}
- (void)loadAttribute:(NSDictionary *)att{
    self->att = att;
}
@end
