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
    
    //global var score
    var score = 0
    var totalAnsweredQuestions = 0
    
    //UI elements linked to IB actions
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var progresslabel: UILabel!
    @IBOutlet weak var answerlabel: UITextField! //field where user can put answer
    @IBOutlet weak var resultlabel: UILabel! //shows if answer is correct or false
    @IBOutlet weak var rightword: UILabel! //if answer is wrong, shows the right answer
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var nextWordLabel: UIButton!
    
    @IBAction func nextword(_ sender: Any) {
        let newWord = randomQuestion((Any).self)
        questionlabel.text = newWord //sets the label automatically to a new word
        rightword.text = "" //right word label disappears
        submitButton.isHidden = false
        nextWordLabel.isHidden = true
    }
    
    // This gets called when the UIViewController is loaded into memory when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = randomQuestion((Any).self)
        questionlabel.text = firstQuestion //displays now the question in the questionlabel
        questionlabel.font = UIFont(name: "Helvetica-Bold", size: 15.0) //installed cocoapods from fontawesome
    }
    
    //function that generates a random english word from the dictionary
    func randomQuestion(_ sender: Any) -> (String) {
        let sizeWords = dict.count //number of items in dictionary (words)
        let randomNumber = Int.random(in: 0 ..< sizeWords) //generates a random number for the position of a word in the dictionary
        let randomQuestion = Array(dict.keys)[randomNumber] //gets random word from dictionary
        //let randomAnswer = randomQuestion.answer
        return randomQuestion
    }
    
    //gives back new score
    func updateUI() {
        if score >= 0 {
            scorelabel.text = "\(score)" //score var is a int. Text label has to be string so we are escaping it
            progresslabel.text = "\(totalAnsweredQuestions)"
        } else {
            score = 0 //prevents the score to go into negative numbers
            scorelabel.text = "\(score)"
            progresslabel.text = "\(totalAnsweredQuestions)"
        }
        
    }
    
    @IBAction func submitlabel(_ sender: Any) {
        let questionInLabel = questionlabel.text
        let answer = dict[questionInLabel!] //check if the ! is in correct use here. otherwise error : Cannot subscript a value of type '[String : String]' with an index of type 'String?'
        //let fittedAnswer = find(value: questionInLabel, in: allQuestions)
        if answer == answerlabel.text {
            resultlabel.text = "correct"
            resultlabel.textColor = UIColor.green
            let newWord = randomQuestion((Any).self)
            questionlabel.text = newWord //sets the label automatically to a new word
            score += 1
            totalAnsweredQuestions += 1
            updateUI()
            
        } else {
            nextWordLabel.isHidden = false
            submitButton.isHidden = true //makes the submitButton disappear
            rightword.text = "The correct answer is : \(String(describing: answer!))"
            resultlabel.text = "wrong"
            resultlabel.textColor = UIColor.red
            score -= 1
            totalAnsweredQuestions += 1
            updateUI()
            
        }
    }
    
    
}



