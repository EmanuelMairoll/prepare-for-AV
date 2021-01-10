//
//  Marbles.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 09.01.21.
//


#import <AVFoundation/AVFoundation.h>
#import "Marbles.h"
#import "Marble.h"
#import "VelocityTriangle.h"
#import "CGVectorOperations.h"

@interface Marbles () <SKPhysicsContactDelegate>

@end

@implementation Marbles{
    bool physicsPaused;
    CGFloat cachedPhysicsSpeed;
    VelocityTriangle *currentVel;
}

- (void)didMoveToView:(SKView *)view{
    [self setScaleMode:SKSceneScaleModeAspectFit];
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];

    self.physicsWorld.contactDelegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    SKNode *touchedNode = [self nodeAtPoint:location];
    if ([touchedNode isKindOfClass:[Marble class]]){
        Marble *marble = (Marble *)touchedNode;
        [self pausePhysics];
        
        currentVel = [VelocityTriangle velocityTriangleForMarble:marble];
        [self insertChild:currentVel atIndex:1];
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];

    [currentVel updateTo:location];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGVector dragVect = [currentVel calculateDragVect];
    CGVector newVelocityVect = multiplyVectorByScalar(dragVect, 3);
    currentVel.marble.physicsBody.velocity = newVelocityVect;
    
    [currentVel removeFromParent];
    currentVel = nil;
    
    [self resumePhysics];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [currentVel removeFromParent];
    currentVel = nil;

    [self resumePhysics];
}

/*
- (void)didBeginContact:(SKPhysicsContact *)contact{
    if ([contact.bodyA.node isKindOfClass:[Marble class]] && [contact.bodyB.node isKindOfClass:[Marble class]]){
        CGFloat volume = contact.collisionImpulse/200.0;
        NSLog(@"V : %f", volume);

        SKAction *volumeAction = [SKAction changeVolumeTo:volume duration:0];
        SKAction *audioAction = [SKAction playSoundFileNamed:@"MarbleCollision.m4a" waitForCompletion:false];
        SKAction *group = [SKAction group:@[audioAction, volumeAction]];
        [contact.bodyA.node runAction:group];
    }
}
*/

- (void)pausePhysics{
    if (!physicsPaused){
        physicsPaused = true;
        cachedPhysicsSpeed = self.physicsWorld.speed;
        self.physicsWorld.speed = 0;
    }
}

- (void)resumePhysics{
    if (physicsPaused){
        self.physicsWorld.speed = cachedPhysicsSpeed;
        cachedPhysicsSpeed = 0;
        physicsPaused = false;
    }
}

@end
