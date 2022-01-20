//
//  Entry.swift
//  TravelDiary
//
//  Created by Arian Mohajer on 1/20/22.
//

import Foundation

class Entry {
    var title: String
    var address: String
    var date: Date
    var description: String
    
    init(title: String, address: String, date: Date = Date(), description: String) {
        self.title = title
        self.address = address
        self.date = date
        self.description = description
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        lhs.title == rhs.title &&
        lhs.address == rhs.address &&
        lhs.description == rhs.description
    }
}
