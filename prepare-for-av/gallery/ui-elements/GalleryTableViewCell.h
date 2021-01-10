//
//  GalleryTableViewCell.h
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 04.01.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GalleryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *titleButton;

@end

NS_ASSUME_NONNULL_END
