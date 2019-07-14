//
//  ViewController.swift
//  HAVO Engels
//
//  Created by Malou Bron on 08/07/2019.
//  Copyright © 2019 Malou Bron. All rights reserved.
//
// make buttons nice

import UIKit
//import FontAwesomeKit
//import ButtonAppearance
import SwiftyButton

class ViewController: UIViewController {
    
    
    //global var score
    var score = 0
    var totalAnsweredQuestions = 0
    
    
    //UI elements linked to IB actions
    
    @IBOutlet weak var submitOutlet: PressableButton!
    @IBOutlet weak var nextWordOutlet: PressableButton!
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var progresslabel: UILabel!
    @IBOutlet weak var answerlabel: UITextField! //field where user can put answer
    @IBOutlet weak var resultlabel: UILabel! //shows if answer is correct or false
    @IBOutlet weak var rightword: UILabel! //if answer is wrong, shows the right answer
    
    // This gets called when the UIViewController is loaded into memory when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextWordOutlet.colors = .init(button: .gray, shadow: .darkGray)
        //nextWordOutlet.disabledColors = .init(button: .gray, shadow: .darkGray) I dont know what this does
        nextWordOutlet.shadowHeight = 10
        nextWordOutlet.cornerRadius = 8
        nextWordOutlet.depth = 0.5
        nextWordOutlet.isHidden = true
        
        rightword.isHidden = true
        
        submitOutlet.colors = .init(button: .gray, shadow: .darkGray)
        //submitOutlet.disabledColors = .init(button: .gray, shadow: .darkGray)
        submitOutlet.shadowHeight = 10
        submitOutlet.cornerRadius = 8
        submitOutlet.depth = 0.5
        
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

    @IBAction func submitButton(_ sender: Any) {
        
        //First check is submitbutton was set on "Submit" or "next word"
        if submitOutlet.title(for: .normal) == "Submit" {
            let questionInLabel = questionlabel.text
            let answer = dict[questionInLabel!] //check if the ! is in correct use here. otherwise error : Cannot subscript a value of type '[String : String]' with an index of type 'String?'
            //let fittedAnswer = find(value: questionInLabel, in: allQuestions)
            //If button was set on Submit check if the answer was correct or not
            if answer == answerlabel.text {
                resultlabel.text = "correct"
                resultlabel.textColor = UIColor.green
                let newWord = randomQuestion((Any).self)
                questionlabel.text = newWord //sets the label automatically to a new word
                score += 1
                totalAnsweredQuestions += 1
                updateUI()
            }
            else {
                rightword.isHidden = false
                submitOutlet.setTitle("Next word", for: .normal)
                rightword.text = "The correct answer is : \(String(describing: answer!))"
                resultlabel.text = "wrong"
                resultlabel.textColor = UIColor.red
                score -= 1
                totalAnsweredQuestions += 1
                updateUI()
            }

            
        }
        //the submitbutton was set on nextword
        else {
            rightword.isHidden = true
            submitOutlet.setTitle("Submit", for: .normal)
            let newWord = randomQuestion((Any).self)
            questionlabel.text = newWord //sets the label automatically to a new word
        }
    }
    
    
}



