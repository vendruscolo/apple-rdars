//
//  AppDelegate.m
//  Control KeyCommand Bug
//
//  Created by Alessandro Vendruscolo on 18/07/25.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)iWorkFine:(id)sender
{
    NSLog(@"I work fine key command %@", sender);
}
- (void)handleControlKeyCommand:(id)sender
{
    NSLog(@"Handle control key command %@", sender);
}

- (void)handleCommandKeyCommand:(id)sender
{
    NSLog(@"Handle command key command %@", sender);
}

- (void)handleCommandControlKeyCommand:(id)sender
{
    NSLog(@"Handle command control key command %@", sender);
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (void)buildMenuWithBuilder:(id<UIMenuBuilder>)builder
{
    if ([builder system] == [UIMainMenuSystem sharedSystem]) {
        [builder insertElements:@[
            [UIMenu menuWithTitle:@"" image:nil identifier:nil options:UIMenuOptionsDisplayInline children:@[
                [UIKeyCommand commandWithTitle:@"I Work Fine" image:nil action:@selector(iWorkFine:) input:@"1" modifierFlags:UIKeyModifierControl propertyList:nil],
                [UIMenu menuWithTitle:@"Children Don't Work" children:@[[UIDeferredMenuElement elementWithProvider:^(void (^_Nonnull completion)(NSArray<UIMenuElement *> *_Nonnull)) {
                UIKeyCommand *keyCommandWithControl = [UIKeyCommand commandWithTitle:@"Control Only" image:nil action:@selector(handleControlKeyCommand:) input:@"2" modifierFlags:UIKeyModifierControl propertyList:nil];
                UIKeyCommand *keyCommandWithCommand = [UIKeyCommand commandWithTitle:@"Command Only" image:nil action:@selector(handleCommandKeyCommand:) input:@"3" modifierFlags:UIKeyModifierCommand propertyList:nil];
                UIKeyCommand *keyCommandWithCommandControl = [UIKeyCommand commandWithTitle:@"Control Command" image:nil action:@selector(handleCommandControlKeyCommand:) input:@"4" modifierFlags:UIKeyModifierControl | UIKeyModifierCommand propertyList:nil];

                completion(@[keyCommandWithControl, keyCommandWithCommand, keyCommandWithCommandControl]);
            }]]]
            ]]
        ]
        beforeMenuForIdentifier:UIMenuFind];

    }
}

@end
