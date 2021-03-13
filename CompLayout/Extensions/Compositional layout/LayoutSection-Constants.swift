//
//  LayoutSection-Constants.swift
//  CompositionalLayout
//
//  Created by Alex Stratu on 13.03.2021.
//

import UIKit

extension NSCollectionLayoutSection {
    
    static let margin: CGFloat = 16
    static let interItem: CGFloat = 8
    
    static var sectionInsets: NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: interItem, leading: margin, bottom: margin, trailing: margin)
    }
}
