We are using UISplitViewController to display a sidebar alongside the main content of the app. The primary view controller is overriding the user interface style: we do this because our design calls for a dark sidebar.
When displaying this view controller on its own (view controller hierarchy: UIWindow → UINavigationController → PrimaryTableViewController) we get the correct behavior: the background is dark, and labels are white.
When displaying this view controller using UISplitViewController (view controller hierarchy: UIWindow → UISplitViewController → (primary) UINavigationController → PrimaryTableViewController) we DO NOT get the same visual result. The background is dark, but labels are black instead of white.
Labels use the system label color, which is black when the user interface style is light, and white when the user interface style is dark.

I’m attaching a sample project. You can get replicate both scenarios by changing the initial view controller in Main.storyboard.
* Set the “wrong traits” scene as initial view controller to have the view controller embedded in a UISplitViewController (replicating the issue)
* Set the “correct traits” scene as initial view controller to skip the UISplitViewController and see how things should look like
