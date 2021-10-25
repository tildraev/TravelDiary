//
//  Log.swift
//  TravelDiary
//
//  Created by Karl Pfister on 10/25/21.
//

import Foundation

/**
Initializes a Log object - *MODEL*
 - Properties:
  - Title: The *Sring* identifier for the Log.
  - Address: The *String* representation for where the user was.
  - Date: The *Date* representation for when last logged. Defaults to the current date and time.
  - Body: The *String* representation of what the user enjoyed about this event.
 */

class Log {
    
    // MARK: - Properties
    var logTitle: String
    var logAddress: String
    var logDate: Date
    var logBody: String
    
    // MARK: - Initializer
    /**
     Initializes, or creates,  a Log object using the data provided
     - Properties:
        - logTitle: The *Sring* identifier for the Log.
        - logAddress: The *String* representation for where the user was.
        - logBody: The *String* representation of what the user enjoyed about this event.
        - logDate: The *Date* representation of when this log was created. Defaults to the current date and time.
     */
    init(logTitle: String, logAddress: String, logDate: Date = Date(), logBody: String) {
        self.logTitle = logTitle
        self.logAddress = logAddress
        self.logDate = logDate
        self.logBody = logBody
    }
} // End of class

extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.logTitle == rhs.logTitle &&
        lhs.logAddress == rhs.logAddress &&
        lhs.logDate == rhs.logDate &&
        lhs.logBody == rhs.logBody
    }
}
