//
//  SecondViewController.swift
//  HAVO Engels
//
//  Created by Malou Bron on 14/07/2019.
//  Copyright © 2019 Malou Bron. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

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
