# UITableView leaves a mask view on a swiped cell, clipping it when reused

## Summary

On iOS 27, when a trailing swipe action's handler waits for an asynchronous
confirmation, and the app then reloads the table with `reloadData()` before
calling the action's completion handler, `UITableView` sets a mask view on
the swiped cell and removes it on a different cell.

When that cell is later dequeued for a taller row, its content is clipped to the
height of the row it was swiped on. The cell itself has the correct size; only
its content is cut off by the leftover `mask`.

## Steps to reproduce

1. Run the attached project on iOS 27 (simulator or device).
2. Swipe left on a short (two-line) row, e.g. "Short event 2", and tap Delete.
3. Confirm the deletion in the action sheet (presented as a popover anchored to the row).
4. Scroll around, and repeat steps 2–3 a few times if needed.

You should see some taller cells get a red background and their content is clipped.

## Expected

Every cell shows all of its content. Cells that come out of the reuse queue have
no mask view left over from a previous swipe.

## Actual

A three-line row ("Event with detail N") reuses the cell that was swiped. Its
detail line is clipped at the height of the deleted two-line row, even though
the row has the correct height.

The sample highlights affected cells in red and logs
`Dequeued cell for row N still has a mask view` when a dequeued cell still has a
`mask`. The red background is clipped by the mask too, so its bottom edge shows
where the content gets cut off.

The app also logs when the cell receives a mask, printing the object pointers.
You'll see a mask gets set on instance A while getting cleared on instance B:

```
[EventCell setMaskView:] cell: 0x00000001026ee300 mask: UIView 0x0000000107030fc0
⚠️ Dequeued cell for row 11 still has a mask view: <UIView: 0x107030fc0; frame = (0 0; 402 78); clipsToBounds = YES; backgroundColor = UIExtendedGrayColorSpace 0 1; layer = <CALayer: 0x1052fd680>> frame: (0.0, 0.0, 402.0, 78.0)
[EventCell setMaskView:] cell: 0x00000001026ed400 mask: nil
```

## Workaround

Code contains two possible workarounds. Short version is we need to make
sure the cell has no mask when it's getting displayed:

1. Clear it in `tableView:cellForRowAtIndexPath:`
2. Clear it in `prepareForReuse`
3. Clear it when handling the trailing action, before reloading the table view

