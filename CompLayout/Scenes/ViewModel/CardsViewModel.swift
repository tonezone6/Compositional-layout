//
//  CardsViewModel.swift
//  CompLayout
//
//  Created by Alex Stratu on 30.11.2020.
//

import Combine
import Foundation

class CardsViewModel {
    @Published var sections: [CardSection] = []
    var subscriptions: [AnyCancellable] = []
    
    init() {
        let sections = Bundle.main
            .decode([CardSection].self, from: "cards.json")
            .publisher
        
        let timer = Timer
            .publish(every: 1.5, on: .main, in: .common)
            .autoconnect()
        
        sections.zip(timer)
            .map(\.0)
            .scan([]) { (collect, section) in
                collect + [section]
            }
            .weakAssign(to: \.sections, on: self)
            .store(in: &subscriptions)
    }
}
