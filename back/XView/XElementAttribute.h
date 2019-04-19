//
//  XElementAttribute.h
//  xml
//
//  Created by KnowChat02 on 2019/4/18.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XElement.h"
NS_ASSUME_NONNULL_BEGIN

@interface XElementAttribute : NSObject<XElement>
@property (nonatomic,copy)NSString* bindTarget;
@end

NS_ASSUME_NONNULL_END
