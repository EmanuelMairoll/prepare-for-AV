//
//  CGVectorOperations.c
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 10.01.21.
//

#include "CGVectorOperations.h"
#include "math.h"

CGFloat absoluteValue(CGVector vect){
    return sqrt(vect.dx * vect.dx + vect.dy * vect.dy);
}

CGVector normalizeVector(CGVector vect){
    CGFloat abs = absoluteValue(vect);
    
    if (abs == 0.0) return CGVectorMake(0, 0);
        
    CGFloat dxNorm = vect.dx / abs;
    CGFloat dyNorm = vect.dy / abs;
    return CGVectorMake(dxNorm, dyNorm);
}

CGVector addVectors(CGVector a, CGVector b){
    return CGVectorMake(a.dx + b.dx, a.dy + b.dy);
}

CGVector multiplyVectorByScalar(CGVector vect, CGFloat s){
    return CGVectorMake(vect.dx * s, vect.dy * s);
}

CGVector rotateVectorByRadians(CGVector vect, CGFloat rad){
    CGFloat abs = absoluteValue(vect);
    CGFloat angle = atan2(vect.dy, vect.dx);
    
    CGFloat newAngle = angle + rad;
    CGFloat newDX = cos(newAngle) * abs;
    CGFloat newDY = sin(newAngle) * abs;
    
    return CGVectorMake(newDX, newDY);
}

CGPoint offsetPointByVector(CGPoint initial, CGVector offset){
    return CGPointMake(initial.x + offset.dx, initial.y + offset.dy);
}
