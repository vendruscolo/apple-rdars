//
//  ViewController.m
//  Window corner radius
//
//  Created by Alessandro Vendruscolo on 29/10/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc] init];

    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view setBackgroundColor:[UIColor redColor]];

    [[self view] addSubview:view];

    [[[view leadingAnchor] constraintEqualToAnchor:[[self view] leadingAnchor]] setActive:YES];
    [[[view trailingAnchor] constraintEqualToAnchor:[[self view] trailingAnchor]] setActive:YES];
    [[[view topAnchor] constraintEqualToAnchor:[[self view] topAnchor]] setActive:YES];
    [[[view bottomAnchor] constraintEqualToAnchor:[[self view] bottomAnchor]] setActive:YES];

    [view setCornerConfiguration:[UICornerConfiguration configurationWithRadius:[UICornerRadius containerConcentricRadius]]];
}


@end
