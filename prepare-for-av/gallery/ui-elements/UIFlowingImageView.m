//
//  UIFlowingImageView.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 06.01.21.
//

#import "UIFlowingImageView.h"

@implementation UIFlowingImageView{
    NSLayoutConstraint *aspectRatioConstraint;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image{
    self = [super initWithImage:image];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage{
    self = [super initWithImage:image highlightedImage: highlightedImage];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setImage:(UIImage *)image{
    [super setImage:image];
    [self updateAspectRatioConstraint];
}

- (void) setup {
    self.contentMode = UIViewContentModeScaleAspectFit;
    [self updateAspectRatioConstraint];
}

- (void) updateAspectRatioConstraint{
    if (aspectRatioConstraint != nil){
        [self removeConstraint:aspectRatioConstraint];
        aspectRatioConstraint = nil;
    }
     
    if (self.image != nil && self.image.size.height != 0){
        CGFloat aspectRatio = self.image.size.width / self.image.size.height;
        NSLayoutConstraint *constraint = [NSLayoutConstraint
                                constraintWithItem:self attribute:NSLayoutAttributeWidth
                                relatedBy:NSLayoutRelationEqual
                                toItem:self attribute:NSLayoutAttributeHeight
                                multiplier:aspectRatio
                                constant:0];
        constraint.priority = 1000;//(UILayoutPriorityDefaultLow + UILayoutPriorityFittingSizeLevel) / 2.0;
        
        aspectRatioConstraint = constraint;
        [self addConstraint:constraint];
        
    }
}

@end

