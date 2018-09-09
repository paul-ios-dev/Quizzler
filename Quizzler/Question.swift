//
//  Question.swift
//  Quizzler
//
//  Created by Kang Paul on 2018/8/27.
//  Copyright © 2018年 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    var questionText: String
    var questionAnswer: Bool
    
    init(text:String, correctAnswer:Bool){
        questionText = text
        questionAnswer = correctAnswer
    }
}
