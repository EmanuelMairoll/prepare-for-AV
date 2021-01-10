//
//  UIFancyTabBar.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 03.01.21.
//

#import "UIFancyTabBar.h"

@implementation UIFancyTabBar{
    CALayer *shapeLayer;
}


- (void)drawRect:(CGRect)rect {
    CAShapeLayer *newLayer = [CAShapeLayer new];
    newLayer.path = [self createPath];
    newLayer.strokeColor = UIColor.lightGrayColor.CGColor;
    newLayer.fillColor = UIColor.whiteColor.CGColor;
    newLayer.lineWidth = 1.0;
    
    if (shapeLayer != nil){
        [self.layer replaceSublayer:shapeLayer with:newLayer];
    }else{
        [self.layer insertSublayer:newLayer atIndex:0];
    }
    
    shapeLayer = newLayer;
}

- (CGPathRef) createPath {
    CGFloat height = 37.0;
    UIBezierPath *path = [UIBezierPath new];
    CGFloat centerWidth = self.frame.size.width / 2;
    
    [path moveToPoint:CGPointMake(0, 0)]; // start top left
    [path addLineToPoint:CGPointMake(centerWidth - height * 2, 0)]; // the beginning of the trough
    
    // first curve down
    [path addCurveToPoint:CGPointMake(centerWidth, height)
            controlPoint1:CGPointMake(centerWidth - 30, 0) controlPoint2:CGPointMake(centerWidth - 35 , height)];
    
    // second curve up
    [path addCurveToPoint:CGPointMake(centerWidth + height * 2, 0)
            controlPoint1:CGPointMake(centerWidth + 35, height) controlPoint2:CGPointMake(centerWidth + 30 , 0)];
    
    // complete the rect
    [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [path closePath];
    
    return path.CGPath;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if ([self clipsToBounds] || [self isHidden] || [self alpha] == 0) return nil;
    
    for (UIView *subview in [[self subviews] reverseObjectEnumerator])
    {
        CGPoint subPoint = [subview convertPoint:point fromView:self];
        UIView *result;
        if ((result = [subview hitTest:subPoint withEvent:event])){
            return result;
        }
    }
    
    return nil;
}

@end


