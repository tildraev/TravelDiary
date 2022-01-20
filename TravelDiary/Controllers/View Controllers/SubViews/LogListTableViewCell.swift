//
//  LogListTableViewCell.swift
//  TravelDiary
//
//  Created by Trevor Walker on 1/20/22.
//

import UIKit

class LogListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var nameLabelTextLabel: UILabel!
    @IBOutlet weak var addressTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    
    // MARK: - Helper Functions
    /// This method is called when we want to build the UI of the cell
    func buildCell(with log: Log) {
        nameLabelTextLabel.text = log.logTitle
        addressTextLabel.text = log.logAddress
        dateTextLabel.text = log.logDate.stringValue()
    }
}
