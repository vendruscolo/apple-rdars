The presented `_UIActivityUserDefaultsViewController` is embedded in a UINavigationController; its navigation bar ignores the `barTintColor` UIAppearance configuration set by the host app, while it applies the `tintColor` configuration. This might result in the "Done" button being hard to see when it's  set to be white using UIAppearance, because said navigation bar is translucent. This gets worse when that view controller is presented over a light one.

See the attached project. The navigation bar has a red background and white button titles (set using UIAppearance). When the _UIActivityUserDefaultsViewController is presented the navigation bar is white with white buttons.
UIAppearance is configured in the AppDelegate. Removing the `tintColor` configuration makes the button visible (because it's blue).

Expected behavior:
1. The presented navigation controller should ignore the `tintColor` too and provide its own color.
-OR-
2. The presented navigation controller should use the `barTintColor` option.