//
//  BubbleView.swift
//  CompLayout
//
//  Created by Alex Stratu on 30.11.2020.
//

import UIKit

@IBDesignable final class BubbleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height/2
    }
    
    func setup(_ color: UIColor) {
        backgroundColor = color.withAlphaComponent(0.4)
        layer.borderColor = color.cgColor
    }
}

private extension BubbleView {
    func setup() {
        layer.borderWidth = 1.5
        setup(.systemTeal)
    }
}
