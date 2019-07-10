//
//  ViewController.swift
//  HAVO Engels
//
//  Created by Malou Bron on 08/07/2019.
//  Copyright © 2019 Malou Bron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UI elements linked to IB actions
    let allQuestions = QuestionBank() //in the questionbank the initlatization doesnt require any parameters
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var progresslabel: UILabel!
    @IBOutlet weak var answerlabel: UITextField!
    
    
    // This gets called when the UIViewController is loaded into memory when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sizeWords = allQuestions.list.count //number of items in list (words)
        let randomNumber = Int.random(in: 0 ..< sizeWords) //generates a random number for the position of a word in the dictionary
        let randomQuestion = allQuestions.list[randomNumber] //gets random word from dictionary
        //let randomAnswer = randomQuestion.answer
        questionlabel.text = randomQuestion.questionText //displays now the question in the questionlabel
    }
    
    @IBAction func submitlabel(_ sender: Any) {
        let questionInLabel = questionlabel.text
        //let fittedAnswer = find(value: questionInLabel, in: allQuestions)
        if "h" == answerlabel.text {
            print(allQuestions)
        } else {
            print("false")
            print(allQuestions)
        }
    }
    
    
}



