//
//  CollectionView-Dequeue.swift
//  CompLayout
//
//  Created by Alex Stratu on 01.12.2020.
//

import UIKit

class CardsCollectionView: UICollectionView {
    typealias CardsDataSource =
        UICollectionViewDiffableDataSource<CardSection, Card>
    
    init() {
        super.init(frame: .zero, collectionViewLayout: .listLayout)
        backgroundColor = .systemGroupedBackground
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Helpers.

extension CardsCollectionView {
    
    private func registerCells() {
        let cell   = UINib(nibName: CardCell.reuseID, bundle: nil)
        let header = UINib(nibName: HeaderView.reuseID, bundle: nil)
        
        register(cell, forCellWithReuseIdentifier: CardCell.reuseID)
        register(header, forSupplementaryViewOfKind: "header",
                 withReuseIdentifier: HeaderView.reuseID)
    }
    
    func configureLayout() {
        guard let dataSource = dataSource as? CardsDataSource else {
            fatalError("data source is not of type `CardsDataSource`")
        }
        let layout = UICollectionViewCompositionalLayout { (index, environment) in
            let snapshot = dataSource.snapshot()
            let sections = snapshot.sectionIdentifiers
            let section = sections[index]
            
            switch section.type {
            case .carousel: return .carouselSection
            case .grid:     return .gridSection(columns: 2)
            case .list:     return .listSection
            }
        }
        setCollectionViewLayout(layout, animated: true)
    }
    
    func item(for indexPath: IndexPath) -> Card? {
        guard let dataSource = dataSource as? CardsDataSource,
              let card = dataSource.itemIdentifier(for: indexPath)
        else { return nil }
        return card
    }
}

// MARK: Cell providers.

extension CardsCollectionView {
    
    var cellProvider: CardsDataSource.CellProvider {
        { (collectionView, indexPath, card) in
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CardCell.reuseID, for: indexPath) as? CardCell
            else { fatalError("`CardCell` cannot be nil") }
            
            guard let dataSource = collectionView.dataSource as? CardsDataSource,
                  let card = dataSource.itemIdentifier(for: indexPath),
                  let section = dataSource.snapshot().sectionIdentifier(containingItem: card)
            else { fatalError("data source is not of type `CardsDataSource`") }
                        
            let vm = CardCellViewModel(card: card, sectionType: section.type)
            cell.configure(with: vm)
            
            return cell
        }
    }
    
    var headerProvider: CardsDataSource.SupplementaryViewProvider {
        { (collectionView, kind, indexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: HeaderView.reuseID, for: indexPath) as? HeaderView
            else { fatalError("`HeaderView` cannot be nil") }
            
            guard let dataSource = collectionView.dataSource as? CardsDataSource else {
                fatalError("data source is not of type `CardsDataSource`")
            }
            let snapshot = dataSource.snapshot()
            let section = snapshot.sectionIdentifiers[indexPath.section]
            
            header.titleLabel.text  = section.title ?? ""
            header.detailLabel.text = "\(section.items.count) cards"
            
            return header
        }
    }
}
