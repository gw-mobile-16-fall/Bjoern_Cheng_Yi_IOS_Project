//
//  PartiesTableViewController.swift
//  party_app
//
//  Created by user122519 on 12/11/16.
//  Copyright © 2016 Bjoern Cheng Yi. All rights reserved.
//

import UIKit

class PartiesTableViewController: UITableViewController {

    // initial values
    var parties = [Party]()
    let persistance = Persistance()
    let cellIdentifier = "partyCell"
    @IBOutlet var partyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting table data
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // when ever this view is going to appear, refresh the list
        parties = persistance.fetchParties()
        tableView.reloadData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // there is only one section
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // the row number equals the party count
        return parties.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell defining function
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath ) as! PartyTableViewCell
        
        // set the date format
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a, MM/dd"
        
        // fetch party record
        let party = parties[indexPath.row]

        // change label
        cell.partyDescriptionLabel.text = "\(party.name) - \(formatter.string(from: party.startDate))"
        
        
        
        return cell
        
        
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete data in the array
            parties.remove(at: indexPath.row)
            persistance.saveParties(parties: parties)
            
            // Delete the row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // this is where we go to the mapView, we pass in the address of the party that is selected.
        // Since the segue is only going to be started when the cell is selected, it is safe to force unwrap indexPathForSelectedRow.
        if segue.identifier == "mapViewSegue" {
            let destination = segue.destination as? MapViewController
            let selectedRow = partyTableView.indexPathForSelectedRow!.row
            destination!.address = parties[selectedRow].address
        }
    }

}
