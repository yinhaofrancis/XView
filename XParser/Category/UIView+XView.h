//
//  UIView+XView.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLoader.h"
#import "XFlex.h"


NS_ASSUME_NONNULL_BEGIN

CGRect XStringToRect(NSString* rectstr);
CGSize XStringToSize(NSString* sizestr);

@interface UIView (XView)<XElementLoader,XFlex>
- (void)loadBackgroundColor:(NSString *)color;
- (void)loadClipBound:(NSString*)flag;
- (void)loadFrame:(NSString *)frame;
- (void)loadCornerRadius:(NSString *)cornerRadius;
- (void)loadContent:(NSString *)content;
- (void)loadShadowRadius:(NSString *)shadowRadius;
- (void)loadShadowOffset:(NSString *)shadowOffset;
- (void)loadShadowColor:(NSString *)color;
- (void)loadShadowOpacity:(NSString *)Opacity;
@end

NS_ASSUME_NONNULL_END
