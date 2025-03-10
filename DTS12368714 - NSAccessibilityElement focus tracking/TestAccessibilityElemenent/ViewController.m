//
//  ViewController.m
//  TestAccessibilityElemenent
//
//  Created by Alessandro Vendruscolo on 07/03/25.
//

#import "ViewController.h"
#import "FBViewBasedAccessibilityElement.h"
#import "FBAccessibilityElement.h"

@interface ViewController ()

@property(strong) IBOutlet NSButton *button;
@property(strong) IBOutlet FBViewBasedAccessibilityElement *viewBasedAXElement;
@property(strong) FBAccessibilityElement *element;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _element = [[FBAccessibilityElement alloc] init];
    [_element setAccessibilityParent:[self view]];

    NSRect frame = [_viewBasedAXElement frame];
    frame.origin.x = NSMaxX([_viewBasedAXElement frame]) + frame.size.width;
    [_element setAccessibilityFrameInParentSpace:frame];

    [[self view] setAccessibilityChildren:@[_button, _viewBasedAXElement, _element]];
}

@end
