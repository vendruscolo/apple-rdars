//
//  BoilerplateViewController.swift
//  SwipeDeleteMaskRepro
//
//  Created by Alessandro Vendruscolo on 29/10/2026.
//

import UIKit

class BoilerplateViewController : UITableViewController {

    public var items: [Item] = []

    init() {
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Swipe to delete"
        tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.reuseIdentifier)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(reset))
        reset()
    }

    @objc private func reset() {
        items = (0..<200).map { index in
            let hour = String(format: "%02d:00", index % 24)
            if index.isMultiple(of: 2) {
                return Item(time: hour, title: "Short event \(index)", detail: nil)
            }
            return Item(time: hour, title: "Event with detail \(index)", detail: "This detail line gets clipped")
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        items[indexPath.row].detail == nil ? 78 : 107
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

}
