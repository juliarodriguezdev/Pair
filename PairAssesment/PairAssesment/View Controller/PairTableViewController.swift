//
//  PairTableViewController.swift
//  PairAssesment
//
//  Created by Julia Rodriguez on 7/19/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import UIKit

class PairTableViewController: UITableViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presentAlertController()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        guard let pairsCount = PairController.sharedInstance.pairsCount else { return 1 }
        return pairsCount
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PairController.sharedInstance.allPeople.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pairCell", for: indexPath)
        
        let name = PairController.sharedInstance.allPeople[indexPath.row]
        
        cell.textLabel?.text = name.fullName

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    
    /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 */


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
        
// alert controller function
        func presentAlertController() {
            
            let alertController = UIAlertController(title: "Add Person", message: "Add someone new to the list", preferredStyle: .alert)
            
            alertController.addTextField { (textField) in
                textField.placeholder = "Enter full name"
                textField.delegate = self
            }
            
            // Action: Add
            let addNameAction = UIAlertAction(title: "Add", style: .default) { (_) in
                // retrieve name from text field
                guard let nameText = alertController.textFields?.first?.text else { return }
                if nameText != "" {
                    // call shared instance add func
                    PairController.sharedInstance.fetchPeople(person: nameText)
                }
            }
            // Action: Cancel
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            // implement actions to Alert Controller (main/parent)
            alertController.addAction(addNameAction)
            alertController.addAction(cancelAction)
            // show configured alert controller
            self.present(alertController, animated: true)
            tableView.reloadData()
            
        }

    }


