//
//  XElement.h
//  xml
//
//  Created by KnowChat02 on 2019/4/18.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XElement <NSObject>

- (instancetype)initWithName:(NSString*)name attribute:(NSDictionary*)att;

@property (nonatomic, readonly) NSString                *name;
@property (nonatomic, readonly) NSDictionary            *attribute;
@property (nonatomic, readonly) NSArray<id<XElement>>   *children;
@property (nonatomic, readonly) NSArray<id<XElement>>   *elementAttribute;
@property (nonatomic, weak)     id<XElement>            parent;

- (void)addChild:(id<XElement>)child;

- (void)completeChildParser;

- (void)loadAttribute:(NSString*)key value:(NSString*)value;

@end

NS_ASSUME_NONNULL_END
