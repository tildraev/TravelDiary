//
//  DiaryTableViewController.swift
//  TravelDiary
//
//  Created by Arian Mohajer on 1/20/22.
//

import UIKit

class DiaryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as? DiaryCellTableViewCell else {return UITableViewCell()}
        // Configure the cell...
        cell.updateView(entry: EntryController.sharedInstance.entries[indexPath.row])
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            EntryController.sharedInstance.entries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.

        //Identity:
        //What segue was triggered?
        if segue.identifier == "toDetailVC" {
            //Index:
            //What cell triggered this segue?
            if let indexPath = tableView.indexPathForSelectedRow {
                //Destination:
                //Where is this transition ending?
                if let destination = segue.destination as? DetailViewController {
                    let log = EntryController.sharedInstance.entries[indexPath.row]
                    destination.entry = log
                }
            }
        }
        
        
        
    
        //Object to send:
        //What object are we trying to send?
    
        //Object to receive:
        //What object is going to catch the data?
    }
    
}
