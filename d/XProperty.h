//
//  XProperty.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLoader.h"
NS_ASSUME_NONNULL_BEGIN

@interface XProperty : NSObject<XElementLoader>
@property(nonatomic,readonly)NSArray* subProperty;
@end

NS_ASSUME_NONNULL_END
