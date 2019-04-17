//
//  UIImageView+XImageView.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+XView.h"
#import "XImageAnimation.h"
NS_ASSUME_NONNULL_BEGIN

@interface XImageView:UIImageView<XElementLoader>

@property (nonatomic, nullable) XImageAnimation* imageAnimation;


@end

NS_ASSUME_NONNULL_END
