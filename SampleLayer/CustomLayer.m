//
//  CustomLayer.m
//  SampleLayer
//
//  Created by Masroo Elahi on 07/04/2017.
//  Copyright © 2017 Masroor Elahi. All rights reserved.
//

#import "CustomLayer.h"
#import <CoreText/CoreText.h>

@implementation CustomLayer
-(id)initWithLayer:(id)layer {
    self = [super initWithLayer:layer];
    
    
    self.bounds = CGRectMake(0, 0, 200, 200);
    self.position = CGPointMake(10,10);
    self.borderColor = [UIColor redColor].CGColor;
    self.borderWidth = 1.5;
    
    return self;
    
}

-(void)drawInContext:(CGContextRef)ctx {
    
    CGRect bounds = [self bounds];
    
    // Text ends up drawn inverted, so we have to reverse it.
    CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
    CGContextTranslateCTM( ctx, bounds.origin.x, bounds.origin.y+bounds.size.height );
    CGContextScaleCTM( ctx, 1, -1 );
    
    // Build a rectangle for drawing in.
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, bounds);
    
    // Create the frame and draw it into the graphics context
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) self.attrString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(framesetter);
    CFRelease(path);
    
    // Finally do the drawing.
    CTFrameDraw(frame, ctx);
    CFRelease(frame);
}

@end
