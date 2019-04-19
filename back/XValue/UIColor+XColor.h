//
//  UIColor+XColor.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XElement.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIColor (XColor)<XElement>
- (instancetype) initWithCode:(NSString*)code;
- (NSArray<NSNumber*> *)seperate:(NSString*)code step:(NSInteger)step;
@end

NS_ASSUME_NONNULL_END
