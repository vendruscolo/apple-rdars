In some places of our app we make use of NSAccessibilityElement subclasses to vend some extra items to accessibility clients.
We need to know which item has the VoiceOver focus so we can keep track of it.

`setAccessibilityFocused:` does not get called when accessibility clients focus NSAccessibilityElements. This method is only called when accessibility clients focus view-based accessibility elements (i.e. when a NSView subclass gets focused).

At the same time we need to programmatically move VoiceOver focus to those items when something happens. Those accessibility elements inherit from NSObject so we can't make them first responder.

Is this the expected behavior? What are our options in terms of reacting to VoiceOver cursor moving around? What are our options in terms of programmatically moving the VoiceOver cursor to a different element?
