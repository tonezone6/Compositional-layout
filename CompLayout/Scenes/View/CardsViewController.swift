//
//  ViewController.swift
//  CompLayout
//
//  Created by Alex on 23/09/2020.
//

import Combine
import UIKit

final class CardsViewController: UIViewController {
    
    let collectionView = CardsCollectionView()
    let viewModel: CardsViewModel
    var subscriptions: [AnyCancellable] = []
        
    init(viewModel: CardsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("storyboard unsupported in this project.")
    }
    
    override func loadView() {
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.$sections.assign(
            to: collectionView,
            cellProvider: collectionView.cellProvider,
            supplementaryViewProvider: collectionView.headerProvider
        ).store(in: &subscriptions)
        
        collectionView.configureLayout()
        collectionView.delegate = self
    }
}

extension CardsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let collection = collectionView as? CardsCollectionView,
              let card = collection.item(for: indexPath)
        else { return }
        
        print(card.title)
    }
}
