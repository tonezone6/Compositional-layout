//
//  CollectionView-Dequeue.swift
//  CompLayout
//
//  Created by Alex Stratu on 01.12.2020.
//

import UIKit

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(nibCell: Cell.Type) {
        let identifier = String(describing: nibCell.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func register<View: UICollectionReusableView>(
        nibReusableView: View.Type, header: Bool = true) {
        
        let identifier = String(describing: nibReusableView.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        let kind = header ? "header" : "footer"
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }
    
    func dequeue<Cell: UICollectionViewCell>(
        cell: Cell.Type, for indexPath: IndexPath, configuration: (Cell) -> Void) -> Cell {
        
        let identifier = String(describing: cell.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell.")
        }
        configuration(cell)
        return cell
    }
    
    func dequeue<View: UICollectionReusableView>(
        reusableView: View.Type, kind: String, for indexPath: IndexPath, configuration: (View) -> Void) -> View {
        
        let identifier = String(describing: reusableView.self)
        guard let reusableView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? View else {
            fatalError("Could not dequeue reusable view.")
        }
        configuration(reusableView)
        return reusableView
    }
}
