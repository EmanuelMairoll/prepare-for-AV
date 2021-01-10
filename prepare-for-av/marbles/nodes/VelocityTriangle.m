//
//  VelocityTriangle.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 09.01.21.
//

#import "VelocityTriangle.h"
#import "CGVectorOperations.h"
#import "math.h"

@implementation VelocityTriangle{
    CGPoint dragPos;
}

+ (instancetype)velocityTriangleForMarble:(Marble *)marble{
    return [[VelocityTriangle alloc] initWithMarble:marble];
}

- (instancetype)initWithMarble:(Marble *)marble{
    self = [super init];
    if (self) {
        _marble = marble;
        
        [self updateTo:marble.position];
    }
    return self;
}

- (void)updateTo:(CGPoint)dragPos{
    self->dragPos = dragPos;

    CGVector dragVec = [self calculateDragVect];
    CGVector normalizedDragVect = normalizeVector(dragVec);
    CGVector halfBaseWidthVect = multiplyVectorByScalar(normalizedDragVect, [self calculateBaseWidth] / 2.0);
    
    CGVector offset1 = rotateVectorByRadians(halfBaseWidthVect, M_PI_2);
    CGVector offset2 = rotateVectorByRadians(halfBaseWidthVect, -M_PI_2);

    CGPoint points[3];
    
    points[0] = dragPos;
    points[1] = offsetPointByVector(_marble.position, offset1);
    points[2] = offsetPointByVector(_marble.position, offset2);

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddLines(path, NULL, points, 3);
    CGPathCloseSubpath(path);
    self.path = path;
    
    CGFloat abs = absoluteValue(dragVec);
    CGFloat colorFactor = MIN(abs/500.0, 1);
    
    CGFloat red = MIN(0.3 + 1.2 * colorFactor, 0.9);
    CGFloat green = MIN(1.2 - 0.8 * colorFactor, 0.9);
    
    self.fillColor = [UIColor colorWithRed:red green:green blue:0.2 alpha:1];
}

- (CGVector)calculateDragVect{
    return CGVectorMake(dragPos.x - _marble.position.x, dragPos.y - _marble.position.y);
}

- (CGFloat)calculateBaseWidth{
    return _marble.frame.size.width * 0.9;
}

@end
