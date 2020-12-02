//
//  Extensions.swift
//  CompLayout
//
//  Created by Alex on 24/09/2020.
//

import UIKit

extension UIView {
    func add(subview: UIView, fill: Bool = false) {
        addSubview(subview)
        
        guard fill else { return }
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.leftAnchor.constraint(equalTo: leftAnchor),
            subview.rightAnchor.constraint(equalTo: rightAnchor),
            subview.topAnchor.constraint(equalTo: topAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
