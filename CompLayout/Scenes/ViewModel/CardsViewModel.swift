//
//  CardsViewModel.swift
//  CompLayout
//
//  Created by Alex Stratu on 30.11.2020.
//

import Combine
import CombineExtensions
import Foundation

class CardsViewModel {
    @Published var sections: [CardSection] = []
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        let sections = Bundle.main.decode(
            [CardSection].self, from: "cards.json")
        
        Just(sections)
            .delay(for: 2, scheduler: RunLoop.main)
            .weakAssign(to: \.sections, on: self)
            .store(in: &subscriptions)
    }
}
