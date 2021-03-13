//
//  LayoutSection-Carousel.swift
//  CompositionalLayout
//
//  Created by Alex Stratu on 13.03.2021.
//

import UIKit

extension NSCollectionLayoutSection {
    
    static var carouselSection: NSCollectionLayoutSection {
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
        section.boundarySupplementaryItems = [.headerItem]
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}


