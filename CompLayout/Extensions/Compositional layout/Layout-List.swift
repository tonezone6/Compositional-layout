//
//  Layout-List.swift
//  CompositionalLayout
//
//  Created by Alex Stratu on 13.03.2021.
//

import UIKit

extension UICollectionViewLayout {
    static var listLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout(section: .listSection)
    }
}
