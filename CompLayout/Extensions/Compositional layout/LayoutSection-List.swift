//
//  LayoutSection-List.swift
//  CompositionalLayout
//
//  Created by Alex Stratu on 13.03.2021.
//

import UIKit

extension NSCollectionLayoutSection {
    
    static var listSection: NSCollectionLayoutSection {
        // Item.
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(200)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group.
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(200)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        // Section.
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = interItem
        section.contentInsets = sectionInsets
        section.boundarySupplementaryItems = [.headerItem]
        
        return section
    }
}
