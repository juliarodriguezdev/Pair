//
//  PairModel.swift
//  PairAssesment
//
//  Created by Julia Rodriguez on 7/19/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import Foundation

class Person: Equatable, Codable {
   
    var fullName: String
    
    init(fullName: String) {
        
        self.fullName = fullName
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        if lhs.fullName != rhs.fullName { return false }
        return true
    }
    
}
