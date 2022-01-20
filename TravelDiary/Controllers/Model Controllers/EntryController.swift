//
//  EntryController.swift
//  TravelDiary
//
//  Created by Arian Mohajer on 1/20/22.
//

import Foundation

class EntryController {
    // MARK: - Singleton
    static var sharedInstance = EntryController()
    
    // MARK: - Source of truth
    var entries = [Entry]()
    
    // MARK: - CRUD functions
    func createEntry(title: String, address: String, description: String){
        let entry = Entry(title: title, address: address, description: description)
        entries.append(entry)
    }
    
    func updateEntry(entry: Entry, title: String, address: String, description: String){
        entry.title = title
        entry.address = address
        entry.description = description
    }
    
    func deleteEntry(entry: Entry){
        guard let index = entries.firstIndex(where: {$0 == entry}) else {return}
        entries.remove(at: index)
    }
}
