//
//  ViewController.swift
//  CompLayout
//
//  Created by Alex on 23/09/2020.
//

import Combine
import CombineExtensions
import UIKit

final class CardsViewController: UICollectionViewController {
    
    let viewModel: CardsViewModel
    var subscription: Cancellable?
        
    init(viewModel: CardsViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .cardsLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("storyboard unsupported in this project.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .systemGray6
        collectionView.registerCardsCells()
        
        subscription = viewModel.$sections.assign(
            to: collectionView,
            cellProvider: collectionView.cardCellProvider,
            supplementaryViewProvider: collectionView.cardsHeaderProvider
        )
    }
}

extension CardsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dataSource = collectionView.dataSource as? CardsDataSource,
              let card = dataSource.itemIdentifier(for: indexPath)
        else { return }
        print("selected", card.title)
    }
}

extension UICollectionViewLayout {
    
    static var cardsLayout: UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:  return .carousel
            case 1:  return .list
            default: return .grid(columns: 2)
            }
        }
    }
}
