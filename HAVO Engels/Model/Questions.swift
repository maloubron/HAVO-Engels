//
//  Questions.swift
//  HAVO Engels
//
//  Created by Malou Bron on 09/07/2019.
//  Copyright © 2019 Malou Bron. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : String
    
    init(text: String, correctAnswer: String) {
        questionText = text
        answer = correctAnswer
    }
}
