Displaying `UIMenuController` from a credentials provider extension results in incorrect behavior. The menu controller is added to a wrong window (probably to the host application) which is beneath the extension's one, making the menu controller invisible to the end user.

Please run the attached project. Note that when the host application is Safari, the menu controller is displayed. In any other app, be it a first party app (such as Settings) or any third party app, the menu controller IS NOT displayed.

Steps to reproduce:
1. Run the attached project, selecting the "Credential Provider" target.
2. When Xcode prompts which app should host the extension, choose Safari.
3. Open any web page which shows a form, such as https://appleid.apple.com/#!&page=signin
4. Tap on the "Passwords" button above the keyboard.
5. The extension fires up, tap on the "Show UIMenuController" button.
6. Notice the menu controller is visible.
7. Tap cancel.
8. Open any other native app which shows a password textfield, such as Settings → Wifi → <Pick a network> → Focus on the password textfield.
9. Repeat steps 4 and 5.
10. Notice how the menu controller is not visible.

This happens on iOS 12 and iOS 13 (13.2, 13.3).