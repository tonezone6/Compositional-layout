//
//  CollectionView-Dequeue.swift
//  CompLayout
//
//  Created by Alex Stratu on 01.12.2020.
//

import UIKit

typealias CardsDataSource = UICollectionViewDiffableDataSource<CardSection, Card>

extension UICollectionView {
        
    func registerCardsCells() {
        let cell = UINib(nibName: CardCell.reuseID, bundle: nil)
        let header = UINib(nibName: CardsHeaderView.reuseID, bundle: nil)
        
        register(cell, forCellWithReuseIdentifier: CardCell.reuseID)
        register(header, forSupplementaryViewOfKind: "header",
                 withReuseIdentifier: CardsHeaderView.reuseID)
    }
    
    var cardCellProvider: CardsDataSource.CellProvider {
        { (collectionView, indexPath, card) in
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CardCell.reuseID, for: indexPath) as? CardCell
            else { fatalError("CardCell cannot be nil") }
            
            guard let dataSource = collectionView.dataSource as? CardsDataSource,
                  let card = dataSource.itemIdentifier(for: indexPath),
                  let section = dataSource.snapshot().sectionIdentifier(containingItem: card)
            else { fatalError("data source is not of type CardsDataSource") }
                        
            let vm = CardCellViewModel(card: card, sectionType: section.type)
            cell.configure(with: vm)
            
            return cell
        }
    }
    
    var cardsHeaderProvider: CardsDataSource.SupplementaryViewProvider {
        { (collectionView, kind, indexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: CardsHeaderView.reuseID, for: indexPath) as? CardsHeaderView
            else { fatalError("CardsHeaderView cannot be nil") }
            
            guard let dataSource = collectionView.dataSource as? CardsDataSource else {
                fatalError("data source is not of type CardsDataSource")
            }
            let snapshot = dataSource.snapshot()
            let section = snapshot.sectionIdentifiers[indexPath.section]
            
            header.titleLabel.text  = section.title ?? ""
            header.detailLabel.text = "\(section.items.count) cards"
            
            return header
        }
    }
}
