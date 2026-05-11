Date pickers can be configured to allow users to input time as well. Once the date picker is waiting for user input and shows the wheels for picking time, users can double tap on the center row to manually type the time.

iOS shows a keyboard with digits only.
iPadOS shows the same keyboard and presents that using a popover.

This popover, starting iPadOS 26.4 is not sized correctly, and you can't see any button.

I'm attaching a screenshot of Calendar.app showing this behavior.

To replicate the issue with the provided project:

1. Run the app on an iPad (simulator is fine) running iPadOS 26.4
2. Tap on the time picker
3. Once the wheels are visible, double tap the selected row
4. A popover opens, and it's too short to fit all buttons
