//
//  NSString+XString.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (XString)
- (NSString*)trimmingSpace;
- (NSString*)removeAllSpace;
- (BOOL)stringBoolValue;
@end

NS_ASSUME_NONNULL_END
