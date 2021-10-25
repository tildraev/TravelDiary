//
//  LogDetailViewController.swift
//  TravelDiary
//
//  Created by Karl Pfister on 10/25/21.
//

import UIKit

class LogDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var logTitleTextField: UITextField!
    @IBOutlet weak var logAddressTextField: UITextField!
    @IBOutlet weak var logDateLabel: UILabel!
    @IBOutlet weak var logBodyTextView: UITextView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Properties
    /// This optional property is commonly referred to as a landing pad, or reciever.
    var log: Log?
    
    //MARK: - Helper Functions
    /**
     Updates the view to display the users' data - Helper Function
     - Description: Guards against the possibility of not having a valid **Log** to display. If the guard statement is passed we display the data of that **Log**. If not, then the user is creating a new **Log** and we do not need to display any data.
     */
    func updateViews() {
        guard let log = log else {return}
        logTitleTextField.text = log.logTitle
        logAddressTextField.text = log.logAddress
        logBodyTextView.text = log.logBody
        logDateLabel.text = log.logDate.stringValue()
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        /// Verifying there is text to save
        guard let title = logTitleTextField.text, let address = logAddressTextField.text, let body = logBodyTextView.text else {return}
        
        /// Checks to see if log has a valid value.
        if let log = log {
            /// The log has a value - Thusly, the user is attempting to update the data within that log. Calls the *update(log:)* method from our Model Controller and passes in the new text values.
            LogController.sharedInstance.update(log: log, newTitle: title, newAddress: address, newBody: body)
        } else {
            /// The log **DOES NOT** have a valid value. Thusly, the user is attempting to create a new log. Calls the *createLog(with:)* method from our Model Controller and passes in the new text values.
            LogController.sharedInstance.createLogEntry(with: title, address: address, body: body)
        }
        /// Send us back to the **LogListTableviewController** as the user is now complete with the tasks on this screen.
        navigationController?.popViewController(animated: true)
    }
} // End of Class
