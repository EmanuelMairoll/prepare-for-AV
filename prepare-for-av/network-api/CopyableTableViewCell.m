//
//  CopyableTableViewCell.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 08.01.21.
//

#import "CopyableTableViewCell.h"

@interface CopyableTableViewCell () <UIGestureRecognizerDelegate>

@end

@implementation CopyableTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        lpgr.minimumPressDuration = 1.0;
        lpgr.delegate = self;
        [self addGestureRecognizer:lpgr];    }
    return self;
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIMenuController* mc = [UIMenuController sharedMenuController];
        [self becomeFirstResponder];
        [mc showMenuFromView:self rect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
}

- (BOOL)canBecomeFirstResponder{
    return true;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(copy:)){
        return true;
    }else{
        BOOL cpa =  [super canPerformAction:action withSender:sender];
        return cpa;
    }
}

- (void)copy:(id)sender{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.textLabel.text;
}

@end
