//
//  CGVectorOperations.h
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 10.01.21.
//

#ifndef CGVectorOperations_h
#define CGVectorOperations_h

#include <stdio.h>
#include <CoreGraphics/CGBase.h>
#include <CoreGraphics/CGGeometry.h>

CGFloat absoluteValue(CGVector vect);
CGVector normalizeVector(CGVector vect);
CGVector addVectors(CGVector a, CGVector b);
CGVector multiplyVectorByScalar(CGVector vect, CGFloat s);
CGVector rotateVectorByRadians(CGVector vect, CGFloat rad);
CGPoint offsetPointByVector(CGPoint initial, CGVector offset);

#endif /* CGVectorOperations_h */


