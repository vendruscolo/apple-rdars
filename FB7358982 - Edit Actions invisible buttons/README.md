The presented `_UIActivityUserDefaultsViewController` is embedded in a UINavigationController; its navigation bar ignores the `barTintColor` UIAppearance configuration set by the host app, while it applies the `tintColor` configuration. This might result in the "Done" button being hard to see when it's  set to be white using UIAppearance, because said navigation bar is translucent. This gets worse when that view controller is presented over a light one.

See the attached project. The navigation bar has a red background and white button titles (set using UIAppearance). When the _UIActivityUserDefaultsViewController is presented the navigation bar is white with white buttons.
UIAppearance is configured in the AppDelegate. Removing the `tintColor` configuration makes the button visible (because it's blue).

![](https://raw.githubusercontent.com/vendruscolo/apple-rdars/master/FB7358982%20-%20Edit%20Actions%20invisible%20buttons/screen.png)

Expected behavior:
1. The presented navigation controller should ignore the `tintColor` too and provide its own color.
-OR-
2. The presented navigation controller should use the `barTintColor` option.

Confirmed to happen on iOS 13.0, iOS 13.1, and iOS 13.1.1.
