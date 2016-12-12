//
//  Persistance.swift
//  party_app
//
//  Created by user122519 on 12/11/16.
//  Copyright © 2016 Bjoern Cheng Yi. All rights reserved.
//

import Foundation

class Persistance {
    
    let partiesKey = "parties"
    
    func saveParty(party:Party) {
        let userDefaults = UserDefaults.standard
        
        var parties = fetchParties()
        
        parties.append(party)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: partiesKey)
        userDefaults.synchronize()
    }
    
    func saveParties(parties:[Party]){
        let userDefaults = UserDefaults.standard
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: partiesKey)
        userDefaults.synchronize()
    }
    
    func fetchParties() -> [Party] {
        let userDefaults = UserDefaults.standard
        
        let parties = userDefaults.object(forKey: partiesKey) as? Data
        
        if let parties = parties {
            return NSKeyedUnarchiver.unarchiveObject(with: parties) as! [Party]
        }
        else{
            return [Party]()
        }
    }
    
    
    
}
