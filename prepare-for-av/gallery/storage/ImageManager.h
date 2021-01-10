//
//  ImageManager.h
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 04.01.21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageManager : NSObject

+ (instancetype) loadFromDisk;

- (void) addImage:(UIImage *)image withTitle:(NSString *)title;
- (NSUInteger) imageCount;
- (UIImage *) imageForIndex:(NSUInteger) index;
- (NSString *) titleForIndex:(NSUInteger) index;
- (void) deleteAtIndex:(NSUInteger) index;

@end

NS_ASSUME_NONNULL_END
