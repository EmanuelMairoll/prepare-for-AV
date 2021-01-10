//
//  UIFancyTabBarController.h
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 02.01.21.
//

#import <UIKit/UIKit.h>
#import "UICircularButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIFancyTabBarController : UITabBarController

@property (strong, nonatomic) IBOutlet UICircularButton *centerButton;

@end

NS_ASSUME_NONNULL_END
