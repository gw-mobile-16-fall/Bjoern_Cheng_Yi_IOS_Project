//
//  PartiesTableViewController.swift
//  party_app
//
//  Created by user122519 on 12/11/16.
//  Copyright © 2016 Bjoern Cheng Yi. All rights reserved.
//

import UIKit

class PartiesTableViewController: UITableViewController {

    var parties = [Party]()
    let persistance = Persistance()
    let cellIdentifier = "partyCell"
    @IBOutlet var partyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        print("tableview load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        parties = persistance.fetchParties()
        tableView.reloadData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath ) as! PartyTableViewCell
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a, MM/dd"
        
        let party = parties[indexPath.row]
        cell.partyDescriptionLabel.text = "\(party.name) - \(formatter.string(from: party.startDate))"
        
        
        
        return cell
        
        
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete data in the array
            parties.remove(at: indexPath.row)
            persistance.saveParties(parties: parties)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mapViewSegue" {
            let destination = segue.destination as? MapViewController
            let selectedRow = partyTableView.indexPathForSelectedRow!.row
            destination!.address = parties[selectedRow].address
        }
    }

}
