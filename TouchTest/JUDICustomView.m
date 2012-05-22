//
//  JUDICustomView.m
//  TouchTest
//

#import "JUDICustomView.h"

#define kCoordinateAdjustment   30
#define kDefaultWidthHieght     50

@implementation JUDICustomView

@synthesize previousTouchLabel;
@synthesize currentTouchLabel;

@synthesize previousTouch;
@synthesize currentTouch;

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    [self updateLabels];
    
    CGContextRef context        = UIGraphicsGetCurrentContext();
    
    CGRect thisRect             = CGRectMake(currentTouch.x - kCoordinateAdjustment,
                                             currentTouch.y - kCoordinateAdjustment, 
                                             kDefaultWidthHieght, 
                                             kDefaultWidthHieght);
    
    CGContextAddEllipseInRect(context, thisRect);
    CGContextDrawPath(context, kCGPathFillStroke);
}


- (void)updateLabels {
    previousTouchLabel.text     = [[NSString alloc]
                                   initWithFormat:@"previous X:%f, Y:%f",
                                   previousTouch.x, previousTouch.y];
    
    currentTouchLabel.text      = [[NSString alloc]
                                   initWithFormat:@"current X:%f, Y:%f",
                                   currentTouch.x, currentTouch.y];
}


# pragma mark -
# pragma touches methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch  = [touches anyObject];
    previousTouch   = [touch locationInView:self];
    currentTouch    = [touch locationInView:self];
    [self setNeedsDisplay];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch  = [touches anyObject];
    previousTouch   = currentTouch;
    currentTouch    = [touch locationInView:self]; 
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch  = [touches anyObject];
    previousTouch   = currentTouch;
    currentTouch    = [touch locationInView:self];
    
    CGFloat pointDifference     = (previousTouch.x + previousTouch.y) -
                                    (currentTouch.x + currentTouch.y);
    
    if (pointDifference != 0)
        NSLog(@"DIFFERENT %f",pointDifference);
    else
        NSLog(@"SAME");
    
    
    
    [self setNeedsDisplay];
}



@end
