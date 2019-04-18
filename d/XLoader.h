//
//  XPropertyLoader.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <Foundation/Foundation.h>


#define checkNil(a) \
if(a.length == 0)\
return;\

NS_ASSUME_NONNULL_BEGIN

@protocol XElementLoader <NSObject>
- (void)loadAttribute:(NSDictionary*)att;
- (void)loadPropertyElement:(id<XElementLoader>)property;
- (void)completePropertyElement;
- (instancetype)initWithAttribute:(NSDictionary*)att;
@end

NS_ASSUME_NONNULL_END
