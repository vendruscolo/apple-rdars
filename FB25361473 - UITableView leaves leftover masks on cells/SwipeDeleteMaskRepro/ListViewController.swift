import UIKit

/// Rows alternate between two-line cells (time + title, 78pt) and three-line
/// cells (time + title + detail, 107pt). Heights come from the delegate and the
/// cell lays out its labels manually (no Auto Layout).
///
/// Deleting a row asks for confirmation first; on confirm the data source
/// changes and the table is reloaded with `reloadData()` (instead of
/// `deleteRows(at:with:)`), and only then is the swipe action's completion
/// handler called.
///
/// Bug: the swiped cell keeps a `mask` view that UIKit set during the swipe.
/// When that cell is reused for a taller row, its content is clipped to the
/// old row height even though the cell itself has the correct size. This is
/// because UIKit clears the mask on the wrong cell object.
final class ListViewController: BoilerplateViewController {

    // MARK: - Data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.reuseIdentifier, for: indexPath) as! EventCell
        cell.configure(with: items[indexPath.row])

        // Make the leftover mask visible: the red background is clipped by the
        // mask too, so its bottom edge shows where the content gets cut off.
        if let mask = cell.mask {
            print("⚠️ Dequeued cell for row \(indexPath.row) still has a mask view: \(mask) frame: \(mask.frame)")
            cell.backgroundColor = .systemRed.withAlphaComponent(0.3)
        } else {
            cell.backgroundColor = nil
        }

        return cell
    }

    // MARK: - Swipe actions

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = items[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completionHandler in
            guard let self else {
                completionHandler(false)
                return
            }
            self.confirmDeletion(of: item, at: indexPath, completionHandler: completionHandler)
        }

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }

    private func confirmDeletion(of item: Item, at indexPath: IndexPath, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "Confirm delete?", message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            // This simulates an async operation where we confirm the operation
            // calling the handler (at the end) while something else in the app
            // saves data to a database and ultimately updates the view
            // controller's data.
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                self?.items.removeAll { $0.id == item.id }
                self?.tableView.setEditing(false, animated: false)
                self?.tableView.reloadData()
            }

            // A possible fix for the bug would be the following: it grabs the
            // cell that is currently displaying the trailing actions and clears
            // the mask view.
//            tableView.cellForRow(at: indexPath)?.mask = nil

            completionHandler(true)
        })

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
            self?.tableView.setEditing(false, animated: true)
            completionHandler(false)
        })

        // Present as a popover anchored to the swiped row, sourced from the table view.
        alert.modalPresentationStyle = .popover
        if let popover = alert.popoverPresentationController {
            popover.sourceView = tableView
            popover.sourceRect = tableView.rectForRow(at: indexPath)
        }

        present(alert, animated: true)
    }
}

final class EventCell : BoilerplateCell {
    // Another possible bug fix is to clear the mask in prepareForReuse
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        mask = nil
//    }

    override var mask: UIView? {
        get {
            super.mask
        }
        set {
            // This logs the cell instance and the mask getting set. Logs show
            // we set the mask on a cell (e.g. 0x1052c8f00) and clear it on a
            // different instance (e.g. 0x1052c8500).
            let cellPointer = Unmanaged.passUnretained(self).toOpaque()
            let maskPointer = newValue.map { "\(type(of: $0)) \(Unmanaged.passUnretained($0).toOpaque())" } ?? "nil"
            print("[EventCell setMaskView:] cell: \(cellPointer) mask: \(maskPointer)")
            super.mask = newValue
        }
    }

}
