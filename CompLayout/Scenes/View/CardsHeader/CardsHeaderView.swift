//
//  HeaderView.swift
//  CompLayout
//
//  Created by Alex Stratu on 01.12.2020.
//

import UIKit

final class CardsHeaderView: UICollectionReusableView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
        containerView.alpha = 0.5
    }
    
    func configure(with viewModel: CardsHeaderViewModel) {
        titleLabel.text = viewModel.title
        detailLabel.text = viewModel.detail
    }
}
