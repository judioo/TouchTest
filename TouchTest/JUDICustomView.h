//
//  JUDICustomView.h
//  TouchTest
//

#import <UIKit/UIKit.h>

@interface JUDICustomView : UIView
@property (weak, nonatomic) IBOutlet UILabel *previousTouchLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTouchLabel;

@property (nonatomic) CGPoint previousTouch;
@property (nonatomic) CGPoint currentTouch;

@end
