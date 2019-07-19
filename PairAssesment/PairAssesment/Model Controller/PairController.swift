//
//  PairController.swift
//  PairAssesment
//
//  Created by Julia Rodriguez on 7/19/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import Foundation

class PairController {
    
    // singleton
    static let sharedInstance = PairController()
    
    // source of truth
    var allPeople: [Person] = []
    
    var pairsCount: Int?
    
    init() {
        loadFromPersistentStorage()
    }
    
    // CRUD
    
    // Create
    
    func createPair(person: String) {
        let person = Person(fullName: person)
        allPeople.append(person)
        let numOfpeople = allPeople.count
        // 5 / 2 = 2 +1 left over, 3 sections
        if numOfpeople % 2 == 0 {
            pairsCount = numOfpeople / 2
        } else {
            pairsCount = (numOfpeople + 1) / 2
        }
        
        saveToPersistentStorage()
    }
    
    // Read
    func fetchPeople(person: String) {
        let person = Person(fullName: person)
        allPeople.append(person)
    }
    
    // Update
    func updatePair(person: String) {
        
        saveToPersistentStorage()
        
    }
    // Delete
    func deletePerson(person: Person) {
        if let personIndex = allPeople.firstIndex(of: person) {
            allPeople.remove(at: personIndex)
        }
        
        saveToPersistentStorage()

    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "PairAssesment.json"
        let documentDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentDirectoryURL
    }
    
    private func loadFromPersistentStorage() {
    
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let pairs = try decoder.decode([Person].self, from: data)
            self.allPeople = pairs
        } catch let error {
            print("There was an error saving to persistent storage: \(error.localizedDescription)")
        }
    }
    
    private func saveToPersistentStorage() {
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(allPeople)
            try data.write(to: fileURL())
        } catch let error {
            print("There was an error saving to persistent storage: \(error.localizedDescription)")
        }
    }
}

