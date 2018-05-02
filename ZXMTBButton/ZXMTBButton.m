//
//  ZXMTBButton.m
//  jiushichide
//
//  Created by 就是吃的 on 2017/7/27.
//  Copyright © 2017年 就是吃的. All rights reserved.
//

#import "ZXMTBButton.h"

#define kScreenScale 1.0 / [UIScreen mainScreen].scale

#define kDefaultPadding (10. * kScreenScale)

@interface ZXMTBButton()

//
//@property(nonatomic, assign) ZXMTBButtonType type;

@property(nonatomic, assign) CGFloat textW;

@end

@implementation ZXMTBButton

-(void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

-(instancetype)init{
    if (self = [super init]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame type:(ZXMTBButtonType)type{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}



-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//    NSLog(@"imageSize1111=====%@",NSStringFromCGSize(self.imageSize));
    if (self.type == ZXMTBButtonTypeHorizontal) {
        return CGRectMake((self.frame.size.width - self.imageSize.width - self.textW) * 0.5 + self.textW, (self.frame.size.height - self.imageSize.height) * 0.5, self.imageSize.width, self.imageSize.height);
    }else{
      return CGRectMake((self.frame.size.width - self.imageSize.width) * 0.5, 0, self.imageSize.width, self.imageSize.height);
    }
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//    NSLog(@"imageSize222222=====%@",NSStringFromCGSize(self.imageSize));
//    NSLog(@"w11111=====%f",self.textW);
    if (self.type == ZXMTBButtonTypeHorizontal) {
        return CGRectMake((self.frame.size.width - self.imageSize.width - self.textW) * 0.5, 0, self.textW, self.frame.size.height);
    }else{
        return CGRectMake(0, self.imageSize.height, self.frame.size.width, self.frame.size.height - self.imageSize.height);
    }
}

-(void)setImageSize:(CGSize)imageSize{
    
    if (self.frame.size.width > 0) {
        if (imageSize.width > self.frame.size.width) {
            imageSize.width = self.frame.size.width;
        }
        if (imageSize.height > self.frame.size.height) {
            imageSize.height = self.frame.size.height;
        }
    }
   
    _imageSize = imageSize;
    CGFloat w = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width - self.imageSize.width, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size.width;
    
//    self.lrPadding = self.frame.size.width - w - self.imageSize.width < (kDefaultPadding * 2) ? kDefaultPadding:(self.frame.size.width - w - self.imageSize.width) * 0.5;
    self.textW = w;
//    NSLog(@"w222222=====%f",self.textW);
}

-(void)setType:(ZXMTBButtonType)type{
    _type = type;
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    CGFloat w = [title boundingRectWithSize:CGSizeMake(self.frame.size.width - self.imageSize.width, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size.width;
    
//    self.lrPadding = self.frame.size.width - w - self.imageSize.width < (kDefaultPadding * 2) ? kDefaultPadding:(self.frame.size.width - w - self.imageSize.width) * 0.5;
    self.textW = w;
//    NSLog(@"w3333333=====%f",self.textW);
}

@end
