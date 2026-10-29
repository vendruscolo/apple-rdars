//
//  EventCell.swift
//  SwipeDeleteMaskRepro
//
//  Created by Alessandro Vendruscolo on 29/10/2026.
//

import UIKit

class BoilerplateCell: UITableViewCell {
    static let reuseIdentifier = "EventCell"

    private let timeLabel = UILabel()
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Fixed font sizes so the content fits the fixed row heights.
        timeLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        timeLabel.textColor = .secondaryLabel
        titleLabel.font = .systemFont(ofSize: 22)
        detailLabel.font = .systemFont(ofSize: 17)
        detailLabel.textColor = .systemBlue

        contentView.addSubview(timeLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Manual layout: stack the visible labels from the top of the content
        // view, inside its layout margins.
        let bounds = contentView.bounds.inset(by: contentView.layoutMargins)
        var y = bounds.minY

        for label in [timeLabel, titleLabel, detailLabel] where !label.isHidden {
            let height = ceil(label.sizeThatFits(CGSize(width: bounds.width, height: .greatestFiniteMagnitude)).height)
            label.frame = CGRect(x: bounds.minX, y: y, width: bounds.width, height: height)
            y += height + 4
        }
    }

    func configure(with item: Item) {
        timeLabel.text = item.time
        titleLabel.text = item.title
        detailLabel.text = item.detail
        detailLabel.isHidden = (item.detail == nil)
        setNeedsLayout()
    }
}
