//
//  LogController.swift
//  TravelDiary
//
//  Created by Karl Pfister on 10/25/21.
//

import Foundation

/// Our Model Controller Class
class LogController {
    
    /// Singleton: To ensure that we are interacting with the *SAME* instance of our *logs* array we created a singleton and will pass around this specific instance of our **LogController**
    static let sharedInstance = LogController()
    
    //MARK: - Source of Truth
    
    /// Source of Truth: The single location we will store our **Log** data.
    var logs: [Log] = []
    
    //MARK: - Crud
    
    /**
     Creates a Log object using the data provided by the View Controller
     - Properties:
     - title: The *Sring* identifier for the Log.
     - address: The *String* representation for where the user was.
     - body: The *String* representation of what the user enjoyed about this event.
     */
    func createLogEntry(with title: String, address: String, body: String) {
        let newLog = Log(logTitle: title, logAddress: address, logBody: body)
        logs.append(newLog)
    }
    /**
     Updates a Log object using the data provided by the View Controller
     - Properties:
     - logToUpdate: The *Log* object whose data will be updated.
     - newTitle: The  new *Sring* identifier for the **Log**.
     - newAddress: The new *String* representation for where the user was.
     - newBody: The new *String* representation of what the user enjoyed about this event.
     */
    func update(log logToUpdate: Log, newTitle: String, newAddress: String, newBody: String) {
        logToUpdate.logTitle = newTitle
        logToUpdate.logAddress = newAddress
        logToUpdate.logBody = newBody
        logToUpdate.logDate = Date()
    }
    /**
     Deletes a Log object
     - Properties:
     - logToDelete: The *Log* object to delete. Deleting the log object also removes any other data associated with it. I.E. -The Title, Body, and so on.
     */
    func delete(log logToDelete: Log) {
        guard let indexOfLogToBeDeleted = logs.firstIndex(of: logToDelete) else {return}
        logs.remove(at: indexOfLogToBeDeleted)
    }
    
} // End of Class
