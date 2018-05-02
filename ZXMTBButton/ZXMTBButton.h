//
//  ZXMTBButton.h
//  jiushichide
//
//  Created by 就是吃的 on 2017/7/27.
//  Copyright © 2017年 就是吃的. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZXMTBButtonTypeHorizontal,
    ZXMTBButtonTypeVertical,
} ZXMTBButtonType;

@interface ZXMTBButton : UIButton


-(instancetype)initWithFrame:(CGRect)frame type:(ZXMTBButtonType)type;

@property(nonatomic, assign) CGSize imageSize;
@property(nonatomic, assign) ZXMTBButtonType type;

@end
