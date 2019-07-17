//
//  SecondViewController.swift
//  HAVO Engels
//
//  Created by Malou Bron on 14/07/2019.
//  Copyright © 2019 Malou Bron. All rights reserved.
//

import UIKit
import Firebase

var myIndex = 0

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var labelIndex: UILabel!
    
    let list = ["Sign out", "quick recap", "level1", "level2", "level3"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    //this functin gets executed when a user taps on a certain tableview cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row //cell the user tapped on
        performSegue(withIdentifier: "wordsView", sender: self)
        //performSegue(withIdentifier: "wordView", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "wordsView" {
            let wordViewcontroller = segue.destination as! ViewController
            wordViewcontroller.data = "\(myIndex)"
        }
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
