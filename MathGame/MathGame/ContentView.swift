//
//  ContentView.swift
//  MathGame
//
//  Created by Aakash Kharabe on 21/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var correctAnswer = 0
    @State private var choiceArray : [Int] = [0, 1, 2, 3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var difficulty = 100
    @State private var score = 0
    
    var body: some View {
        VStack {
            Text("\(firstNumber) + \(secondNumber)")
                .font(.largeTitle)
                .bold()
            
            HStack {
                ForEach(0..<2) { index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswer()
                    } label: {
                        AnsButton(number: choiceArray[index])
                    }
                }
            }
            
            HStack {
                ForEach(2..<4) { index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswer()
                    } label: {
                        AnsButton(number: choiceArray[index])
                    }
                }
            }
            Text("Score: \(score)")
                .font(.headline)
                .bold()
            
        }.onAppear(perform: generateAnswer)
    }
    
    func answerIsCorrect(answer: Int) {
        let isCorrect = answer == correctAnswer ? true : false
        
        if isCorrect {
            self.score += 1
        } else {
            self.score -= 1
        }
    }
 
    func generateAnswer() {
        firstNumber = Int.random(in: 0...(difficulty/2))
        secondNumber = Int.random(in: 0...(difficulty/2))
        var answerlist = [Int]()
        
        
        correctAnswer = firstNumber + secondNumber
        
        for i in 0...2 {
            answerlist.append(Int.random(in: 0...difficulty))
        }
        
        answerlist.append(correctAnswer)
        
        choiceArray = answerlist.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
