//
//  UIImageView+XView.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLoader.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (XView)<XElementLoader>
- (void)loadImage:(NSString *)content;
@end

NS_ASSUME_NONNULL_END
