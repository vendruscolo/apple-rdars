//
//  FBViewBasedAccessibilityElement.m
//  TestAccessibilityElemenent
//
//  Created by Alessandro Vendruscolo on 07/03/25.
//

#import "FBViewBasedAccessibilityElement.h"

@implementation FBViewBasedAccessibilityElement

- (void)drawRect:(NSRect)dirtyRect {
    [[NSColor redColor] setFill];
    NSRectFill([self bounds]);
}

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
