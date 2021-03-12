//
//  LayoutSection-Grid.swift
//  CompLayout
//
//  Created by Alex Stratu on 30.11.2020.
//

import UIKit

extension NSCollectionLayoutSection {
    static let margin: CGFloat = 16
    static let interItem: CGFloat = 8
    static var sectionInsets: NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: interItem, leading: margin, bottom: margin, trailing: margin)
    }
    
    static var header: NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: size, elementKind: "header", alignment: .top
        )
        return supplementaryItem
    }
    
    static var list: NSCollectionLayoutSection {
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
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    static func grid(columns: Int) -> NSCollectionLayoutSection {
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
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    static var carousel: NSCollectionLayoutSection {
        // Item.
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group.
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.85),
            heightDimension: .fractionalWidth(0.5)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(interItem)
        
        // Section.
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = interItem
        section.contentInsets = sectionInsets
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}
