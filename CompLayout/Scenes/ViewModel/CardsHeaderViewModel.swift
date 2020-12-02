//
//  SectionHeaderViewModel.swift
//  CompLayout
//
//  Created by Alex Stratu on 01.12.2020.
//

struct CardsHeaderViewModel {
    let title: String
    let detail: String
    
    init(section: Section) {
        self.title = section.title
        self.detail = "\(section.items.count) cards"
    }
}
