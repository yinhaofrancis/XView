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


- (void)addChild:(id<XElement>)child;

- (void)completeChildParser;

- (void)loadAttribute:(NSString*)key value:(NSString*)value;

@end

@protocol XAttribute <NSObject>

- (instancetype)initWithCode:(NSString*)code;

@end
NS_ASSUME_NONNULL_END
