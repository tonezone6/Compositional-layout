//
//  Section.swift
//  CompLayout
//
//  Created by Alex on 24/09/2020.
//

struct Section: Hashable, Decodable {
    enum `Type`: String, Decodable {
        case carousel, list, grid
    }
    
    let type: Type
    let title: String
    let items: [Card]
}
