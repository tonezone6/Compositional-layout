//
//  LayoutSection-Grid.swift
//  CompositionalLayout
//
//  Created by Alex Stratu on 13.03.2021.
//

import UIKit

extension NSCollectionLayoutSection {
    
    static func gridSection(columns: Int) -> NSCollectionLayoutSection {
        // Item.
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group.
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.5)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
        group.interItemSpacing = .fixed(interItem)
        
        // Section.
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = interItem
        section.contentInsets = sectionInsets
        section.boundarySupplementaryItems = [.headerItem]
        
        return section
    }
}
