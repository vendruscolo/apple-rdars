//
//  FBAccessibilityElement.m
//  TestAccessibilityElemenent
//
//  Created by Alessandro Vendruscolo on 07/03/25.
//

#import "FBAccessibilityElement.h"

@implementation FBAccessibilityElement

- (BOOL)isAccessibilityElement
{
    return YES;
}

- (NSAccessibilityRole)accessibilityRole
{
    return NSAccessibilityStaticTextRole;
}

- (NSString *)accessibilityLabel
{
    return NSStringFromClass([self class]);
}

- (void)setAccessibilityFocused:(BOOL)accessibilityFocused
{
    NSLog(@"Set accessibility focus called. Self: %@, is focused: %@", self, @(accessibilityFocused));
}

@end
