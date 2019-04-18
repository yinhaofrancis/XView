//
//  XElementAttribute.m
//  xml
//
//  Created by KnowChat02 on 2019/4/18.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "XElementAttribute.h"

@implementation XElementAttribute{
    NSMutableArray<id<XElement>>* _elementAttribute;
}

@synthesize attribute;

@synthesize children;

@synthesize name;

@dynamic elementAttribute;

- (void)addChild:(nonnull id<XElement>)child {
    [_elementAttribute addObject:child];
}

- (NSArray<id<XElement>> *)elementAttribute{
    return _elementAttribute;
}

- (void)completeChildParser {
    
}
- (nonnull instancetype)initWithName:(nonnull NSString *)name attribute:(nonnull NSDictionary *)att {
    self = [super init];
    if (self){
        self->name = name.copy;
        self->attribute = att.copy;
        _elementAttribute = [[NSMutableArray alloc] init];
        self.bindTarget = att[@"target"];
    }
    return self;
}

- (void)loadAttribute:(nonnull NSString *)key value:(nonnull NSString *)value {
    
}

@end
