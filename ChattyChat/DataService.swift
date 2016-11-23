//
//  DataService.swift
//  ChattyChat
//
//  Created by Patrick Gross on 23/11/2016.
//  Copyright © 2016 Patrick Gross. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    
    private static let _instance = DataService()
    
    static var instance: DataService {
        
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        
        return FIRDatabase.database().reference()
    }
}
