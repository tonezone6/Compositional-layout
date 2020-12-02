//
//  CardsViewModel.swift
//  CompLayout
//
//  Created by Alex Stratu on 30.11.2020.
//

import Foundation
import Combine

struct CardsViewModel {
    let sections: Future<[Section], Error>
    
    init() {
        sections = Future<[Section], Error> { promise in
            let sections = Bundle.main.decode([Section].self, from: "cards.json")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                promise(.success(sections))
            }
        }
    }
}
