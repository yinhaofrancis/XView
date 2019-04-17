//
//  UIColor+XColor.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (XColor)
- (instancetype) initWithString:(NSString*)code;
- (NSArray<NSNumber*> *)seperate:(NSString*)code step:(NSInteger)step;
@end

NS_ASSUME_NONNULL_END
