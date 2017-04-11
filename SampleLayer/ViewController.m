//
//  ViewController.m
//  SampleLayer
//
//  Created by Masroo Elahi on 07/04/2017.
//  Copyright © 2017 Masroor Elahi. All rights reserved.
//

//Sample application to make Text layer with NSAttributed String and its all properties
#import "ViewController.h"
#import "CustomLayer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   //Make Custom layer Object
    CustomLayer * layer = [[CustomLayer alloc] initWithLayer:[CALayer layer]];
    
    // Make attributed string with Character spacing and line spacing
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 20.0;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:paragraphStyle,NSParagraphStyleAttributeName , [NSNumber numberWithFloat:5.0] , NSKernAttributeName,[UIFont fontWithName:@"Kohinoor Bangla" size:28.0],NSFontAttributeName,[UIColor purpleColor],NSForegroundColorAttributeName, nil];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:@"Apple Byte \n Testing" attributes:attributes];
    layer.attrString = attributedString;
    
    //Add sublayer in current view
    
    [self.view.layer addSublayer:layer];
    
    // Set layer position
    layer.position = self.view.center;
    
    //Update layer -Call to drawInContext
    [layer setNeedsDisplay];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
