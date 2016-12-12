//
//  Party.swift
//  party_app
//
//  Created by user122519 on 12/11/16.
//  Copyright © 2016 Bjoern Cheng Yi. All rights reserved.
//

import Foundation

class Party: NSObject, NSCoding {
    
    let id:String
    let name: String
    let startDate: Date
    let address: String
    let nameKey = "name"
    let startDateKey = "startDate"
    let idKey = "id"
    let addressKey = "address"
    
    init(name: String, startDate: Date, address: String) {
        
        self.id = NSUUID().uuidString
        self.name = name
        self.startDate = startDate
        self.address = address
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: nameKey) as! String
        startDate = aDecoder.decodeObject(forKey: startDateKey) as! Date
        id = aDecoder.decodeObject(forKey: idKey) as! String
        address = aDecoder.decodeObject(forKey: addressKey) as! String
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: nameKey)
        aCoder.encode(startDate, forKey: startDateKey)
        aCoder.encode(id, forKey: idKey)
        aCoder.encode(address,forKey:addressKey)
    }
    
}
