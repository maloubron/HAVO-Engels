//
//  SecondViewController.swift
//  HAVO Engels
//
//  Created by Malou Bron on 14/07/2019.
//  Copyright © 2019 Malou Bron. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["milk", "honey", "bread", "tacos", "tomatoes"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    

    //user presses logout button
    @IBAction func logOutButton(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            print("There was a error trying to sign out")
        }
    }
    
    @IBAction func segueButton(_ sender: Any) {
        performSegue(withIdentifier: "wordsView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
