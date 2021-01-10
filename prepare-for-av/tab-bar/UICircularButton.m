//
//  UICircularButton.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 03.01.21.
//

#import "UICircularButton.h"

@implementation UICircularButton

- (void) setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (void) setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (void) setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

- (void) applyGradient:(NSArray *)colors{
    CAGradientLayer *gradientLayer = [CAGradientLayer new];
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.frame = self.bounds;
    [self.layer insertSublayer: gradientLayer atIndex:0];
}

@end
