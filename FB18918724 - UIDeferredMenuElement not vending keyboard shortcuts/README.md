Adding menu items to the menu bar on iPad using UIDeferredMenuElement to build a list of menu items that are not know ahead of time works, but keyboard shortcuts aren’t picked up by the system nor are displayed next to the menu element in the menu bar.

Xcode 26 beta 3, testing on iPadOS 26 beta 3.

Please see attached project to reproduce the issue.

When running the app, the faulty menu is at Edit > Children Don’t Work > […]
Edit > I Work Fine menu item is registered without using UIDeferredMenuElement, and the keyboard shortcut is picked up just fine.
