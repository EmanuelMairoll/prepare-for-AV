//
//  UICircularButton.h
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 03.01.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface UICircularButton : UIButton
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor *borderColor;

- (void) applyGradient:(NSArray *)colors;

@end

NS_ASSUME_NONNULL_END
