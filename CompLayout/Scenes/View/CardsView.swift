//
//  View.swift
//  CompLayout
//
//  Created by Alex on 24/09/2020.
//

import UIKit

final class CardsView: UIView {
    

    override init(frame: CGRect) {
       
        
        super.init(frame: frame)
    
        add(subview: collectionView, fill: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

