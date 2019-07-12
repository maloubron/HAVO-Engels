//
//  ViewController.swift
//  HAVO Engels
//
//  Created by Malou Bron on 08/07/2019.
//  Copyright © 2019 Malou Bron. All rights reserved.
//

import UIKit
import FontAwesomeKit

class ViewController: UIViewController {
    
    //UI elements linked to IB actions
    
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var progresslabel: UILabel!
    @IBOutlet weak var answerlabel: UITextField!
    
    
    // This gets called when the UIViewController is loaded into memory when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sizeWords = dict.count //number of items in dictionary (words)
        let randomNumber = Int.random(in: 0 ..< sizeWords) //generates a random number for the position of a word in the dictionary
        let randomQuestion = Array(dict.keys)[randomNumber] //gets random word from dictionary
        //let randomAnswer = randomQuestion.answer
        questionlabel.text = randomQuestion //displays now the question in the questionlabel
        questionlabel.font = UIFont(name: "Helvetica-Bold", size: 15.0) //installed cocoapods from fontawesome
    }
    
    @IBAction func submitlabel(_ sender: Any) {
        let questionInLabel = questionlabel.text
        let answer = dict[questionInLabel!] //check if the ! is in correct use here. otherwise error : Cannot subscript a value of type '[String : String]' with an index of type 'String?'
        //let fittedAnswer = find(value: questionInLabel, in: allQuestions)
        if answer == answerlabel.text {
            print("correct")
            print(answer)
        } else {
            print("false")
            print(answer)
        }
    }
    
    
}



