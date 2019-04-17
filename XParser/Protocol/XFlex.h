//
//  XFlex.h
//  XParser
//
//  Created by KnowChat02 on 2019/4/17.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, Just) {
    justFlexStart,
    justFlexCenter,
    justFlexEnd,
    justSpaceBetween,
    justSpaceAround,
    justSpaceEvenly,
    justStretch
};
typedef NS_ENUM(NSUInteger, Align) {
    alignFlexStart,
    alignFlexEnd,
    alignCenter,
    alignStretch
};
typedef NS_ENUM(NSUInteger, Direction) {
    row,
    colume
};

@protocol XFlex <NSObject>

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat grow;
@property (nonatomic, assign) CGFloat shrink;
@property (nonatomic, assign) Direction direction;
@property (nonatomic, assign) Just justContent;
@property (nonatomic, assign) Align alignItems;
@property (nonatomic, assign) Align alignContent;
@property (nonatomic, assign) Align alignSelf;
@property (nonatomic, assign) BOOL Wrap;
@end

NS_ASSUME_NONNULL_END
