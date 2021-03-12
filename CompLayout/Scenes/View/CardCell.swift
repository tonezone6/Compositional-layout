//
//  CardCell.swift
//  CompLayout
//
//  Created by Alex Stratu on 30.11.2020.
//

import UIKit

final class CardCell: UICollectionViewCell {
    static let reuseID = "CardCell"

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var bubbleView: BubbleView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.cornerRadius = 8
    }
    
    func configure(with viewModel: CardCellViewModel) {
        bubbleView.setup(UIColor(hexString: viewModel.bubbleColor))
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        dateLabel.text = viewModel.date
        dateLabel.isHidden = viewModel.compact
    }
}
