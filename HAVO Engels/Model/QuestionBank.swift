//
//  QuestionBank.swift
//  HAVO Engels
//
//  Created by Malou Bron on 10/07/2019.
//  Copyright © 2019 Malou Bron. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    init(){
        list.append(Question(text: "hello", correctAnswer: "hallo"))
        list.append(Question(text: "yes", correctAnswer: "ja"))
        list.append(Question(text: "no", correctAnswer: "nee"))
        list.append(Question(text: "bye", correctAnswer: "doei"))
    }
    
}
