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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
            self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else{
        let alert = UIAlertController(title: "Empty name", message: "Please make sure the name is filled", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        
       guard let address = addressTextField.text, !address.isEmpty else{
            let alert = UIAlertController(title: "Empty address", message: "Please make sure the address is filled", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        let date = startDateDatePicker.date
        
        let party = Party(name: name, startDate: date, address: address)
        persistance.saveParty(party: party)
        self.dismiss(animated: true, completion: nil)
        
        
    }
     /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
