//
//  AddPartyViewController.swift
//  party_app
//
//  Created by user122519 on 12/11/16.
//  Copyright © 2016 Bjoern Cheng Yi. All rights reserved.
//

import UIKit

class AddPartyViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var startDateDatePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    let persistance = Persistance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        // if cancel is hit, we just need to exit
            self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        // perform empty text field test for name
        guard let name = nameTextField.text, !name.isEmpty else{
        let alert = UIAlertController(title: "Empty name", message: "Please make sure the name is filled", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        // perform empty text field test for address
        guard let address = addressTextField.text, !address.isEmpty else{
            let alert = UIAlertController(title: "Empty address", message: "Please make sure the address is filled", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        // get date
        let date = startDateDatePicker.date
        
        // create party data
        let party = Party(name: name, startDate: date, address: address)
        persistance.saveParty(party: party)
        self.dismiss(animated: true, completion: nil)
        
        
    }


}
