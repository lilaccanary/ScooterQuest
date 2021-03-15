//
//  QuestQuestonsModel.swift
//  ScooterQuests
//
//  Created by Olka on 11.03.2021.
//

import Foundation

struct Quest: Decodable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var rightAnswer: String
    var geoAnswer: String
    
    internal init(step: Task){
        self.question = step.question
        self.answer1 = step.answers[0]
        self.answer2 = step.answers[1]
        self.answer3 = step.answers[2]
        self.rightAnswer = step.answers[3] //
        self.geoAnswer = step.answers[4] //
        
    }
}

internal struct Task: Decodable {
    var question: String
    var answers: [String]
}


class DataService {
    func getData() -> Quest? {
        let decoder = JSONDecoder()
        guard let path = Bundle.main.path(forResource: "Quest15KmQuestions", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let quest = try?decoder.decode(Task.self, from: data)
        else {
            return nil
        }
        return Quest(step: quest)
    }
}
