//
//  UIFancyTabBarController.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 02.01.21.
//

#import "UIFancyTabBarController.h"
#import "UIFancyTabBar.h"



@implementation UIFancyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCenterButton];
}

- (void)setupCenterButton {
    [self.tabBar addSubview:_centerButton];
    
    CGRect centerButtonFrame = _centerButton.frame;
    centerButtonFrame.origin.y = self.tabBar.bounds.size.height - centerButtonFrame.size.height - 20;
    centerButtonFrame.origin.x = self.tabBar.bounds.size.width/2 - centerButtonFrame.size.width/2;
    _centerButton.frame = centerButtonFrame;
    
    UIColor *colorOne = [UIColor colorWithRed:0.195 green:0.586 blue:0.742 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:0.195  green:0.742  blue:0.742  alpha:1.0];

    NSMutableArray *colors = [NSMutableArray arrayWithObject:colorOne];
    [colors addObject:colorTwo];
}

- (IBAction)centerButtonClicled {
    [self setSelectedIndex:1];
}


@end
