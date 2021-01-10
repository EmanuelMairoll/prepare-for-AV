//
//  VelocityTriangle.h
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 09.01.21.
//

#import <SpriteKit/SpriteKit.h>
#import "Marble.h"

NS_ASSUME_NONNULL_BEGIN

@interface VelocityTriangle : SKShapeNode

@property (readonly) Marble *marble;

+ (instancetype)velocityTriangleForMarble:(Marble *)marble;
- (instancetype)initWithMarble:(Marble *)marble;
- (void)updateTo:(CGPoint)dragPos;
- (CGVector)calculateDragVect;

@end

NS_ASSUME_NONNULL_END
