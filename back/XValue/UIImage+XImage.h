//
//  UIImage+XImage.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XElement.h"
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ImageDataType) {
    ImageDataName,
    ImageDataAnimationName,
    ImageDataBlob,
    ImageDataUnknown
};
@interface UIImage (XImage)<XElement,XAttribute>

@end

NS_ASSUME_NONNULL_END
