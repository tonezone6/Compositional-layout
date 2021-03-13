//
//  LayoutSection-Grid.swift
//  CompLayout
//
//  Created by Alex Stratu on 30.11.2020.
//

import UIKit

extension NSCollectionLayoutBoundarySupplementaryItem {
    
    static var headerItem: NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: size, elementKind: "header", alignment: .top
        )
        return supplementaryItem
    }
}
