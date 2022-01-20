//
//  DiaryCellTableViewCell.swift
//  TravelDiary
//
//  Created by Arian Mohajer on 1/20/22.
//

import UIKit

class DiaryCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func updateView(entry: Entry) {
        //TODO: - Finish this
        tripNameLabel.text = entry.title
        addressLabel.text = entry.address
        dateLabel.text = entry.date.stringValue()
    }

} //End of class
