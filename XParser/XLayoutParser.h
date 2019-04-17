//
//  XLayoutParser.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLayoutParser : NSObject
+(XLayoutParser*)shared;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (UIView*)parseLayout:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
