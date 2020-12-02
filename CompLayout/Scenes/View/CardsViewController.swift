//
//  ViewController.swift
//  CompLayout
//
//  Created by Alex on 23/09/2020.
//

import UIKit
import Combine

final class CardsViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Card>
    
    let viewModel: CardsViewModel
    var dataSource: DataSource!
    var collectionView: UICollectionView!
    var subscription: AnyCancellable?
        
    init(viewModel: CardsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("storyboard unsupported in this project.")
    }
    
    override func loadView() {
        collectionView = createCollectionView()
        createDataSource(with: collectionView)
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscription = viewModel.sections
            .sink(receiveCompletion: { completion in
                print("loading cards", completion)
            }, receiveValue: { [unowned self] sections in
                dataSource.add(sections)
            })
    }
}

private extension CardsViewController {
    var layout: UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:  return .carousel
            case 2:  return .grid(columns: 2)
            default: return .list
            }
        }
    }
    
    func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray6
        collectionView.register(nibCell: CardCell.self)
        collectionView.register(nibReusableView: CardsHeaderView.self)
        return collectionView
    }

    func createDataSource(with collectionView: UICollectionView) {
        dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { [unowned self] (collectionView, indexPath, card) in
                collectionView.dequeue(cell: CardCell.self, for: indexPath) { cell in
                    guard let card = dataSource.itemIdentifier(for: indexPath),
                          let section = dataSource.snapshot().sectionIdentifier(containingItem: card)
                    else { fatalError("could not get card or section.") }
                    let viewModel = CardCellViewModel(card: card, sectionType: section.type)
                    cell.configure(with: viewModel)
                }
            })

        dataSource.supplementaryViewProvider = { [unowned self] (collectionView, kind, indexPath) in
            collectionView.dequeue(reusableView: CardsHeaderView.self, kind: kind, for: indexPath) { header in
                let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
                let viewModel = CardsHeaderViewModel(section: section)
                header.configure(with: viewModel)
            }
        }
    }
}

private extension UICollectionViewDiffableDataSource
    where SectionIdentifierType == Section, ItemIdentifierType == Card {
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Card>
    
    func add(_ sections: [Section]) {
        var snapshot = Snapshot()
        for section in sections {
            snapshot.appendSections([section])
            snapshot.appendItems(section.items)
            apply(snapshot)
        }
    }
}
