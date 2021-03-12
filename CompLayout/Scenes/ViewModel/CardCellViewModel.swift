//
//  CardCellViewModel.swift
//  CompLayout
//
//  Created by Alex Stratu on 30.11.2020.
//

import Foundation

struct CardCellViewModel {
    
    let title: String
    let subtitle: String
    let date: String
    let compact: Bool
    let bubbleColor: String
    
    init(card: Card, sectionType: SectionType) {
        switch sectionType {
        case .carousel: bubbleColor = "#FE5A2A"
        case .list:     bubbleColor = "#FE9E2A"
        case .grid:     bubbleColor = "#24EE33"
        }
        
        title = card.title
        subtitle = card.subtitle
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        if let date = formatter.date(from: card.date) {
            formatter.dateStyle = .medium
            self.date = formatter.string(from: date)
        } else {
            self.date = "N/A"
        }
        
        compact = (sectionType == .grid)
    }
}
