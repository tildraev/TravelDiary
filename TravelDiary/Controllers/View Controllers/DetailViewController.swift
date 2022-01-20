//
//  DetailViewController.swift
//  TravelDiary
//
//  Created by Arian Mohajer on 1/20/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripDetailsTextView: UITextView!
    
    var entry: Entry? = nil
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let entry = entry else {return}
        titleTextField.text = entry.title
        addressTextField.text = entry.address
        dateLabel.text = entry.date.stringValue()
        tripDetailsTextView.text = entry.description
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title   = titleTextField.text, !title.isEmpty,
              let address = addressTextField.text, !address.isEmpty,
              let details = tripDetailsTextView.text, !details.isEmpty else {return}
            
            if let entry = entry {
                //update
                EntryController.sharedInstance.updateEntry(entry: entry, title: title, address: address, description: details)
            }
            else {
                //create
                let entry = Entry(title: title, address: address, description: details)
                EntryController.sharedInstance.entries.append(entry)
            }
        self.navigationController?.popViewController(animated: true)
                
    }
    
    
}
