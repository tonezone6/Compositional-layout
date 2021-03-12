//
//  Section.swift
//  CompLayout
//
//  Created by Alex on 24/09/2020.
//

import CombineExtensions

enum SectionType: String, Decodable {
    case carousel
    case list
    case grid
}

struct CardSection: Section, Decodable {
    let type: SectionType
    let title: String?
    let items: [Card]
}
