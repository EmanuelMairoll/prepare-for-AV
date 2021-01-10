//
//  UIImage+normalizeImage.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 06.01.21.
//

#import "UIImage+normalizeImage.h"

@implementation UIImage (NormalizeImage)

- (UIImage *) normalized {
    if (self.imageOrientation == UIImageOrientationUp) return self;

    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

@end
