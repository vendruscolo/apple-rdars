//
//  ViewController.m
//  BarButtonItemTruncation
//
//  Created by Alessandro Vendruscolo on 14/08/25.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong, nonatomic) UIBarButtonItem *icon;
@property(strong, nonatomic) UIBarButtonItem *icon2;
@property(strong, nonatomic) UIBarButtonItem *icon3;
@property(strong, nonatomic) UIBarButtonItem *longTitle;
@property (weak, nonatomic) IBOutlet UISwitch *switchControl;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _icon = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"gear"] menu:nil];
    _icon2 = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"pencil.circle"] menu:nil];
    _icon3 = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"scribble"] menu:nil];

    _longTitle = [[UIBarButtonItem alloc] initWithTitle:@"I am a long long long long long long title" menu:nil];
    _longTitle.possibleTitles = [NSSet setWithArray:@[
        @"I am a long long long long long long title",
        @"short",
        @"slightly shorter"
    ]];

    [self switchToggled:_switchControl];
}


- (IBAction)switchToggled:(UISwitch *)sender {
    if ([sender isOn]) {
        self.navigationItem.leftBarButtonItems = @[_icon, _icon2, _icon3, _longTitle];
    } else {
        self.navigationItem.leftBarButtonItems = @[_longTitle];
    }
}

@end
