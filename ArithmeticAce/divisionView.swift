//
//  divisionView.swift
//  arithmeticAce
//
//  Created by William Robert Harrington on 2022-02-08.
//

import SwiftUI

struct divisionView: View {
    
    // MARK: Stored properties
    @State var value1 = Int.random(in: 1...12)
    @State var value2 = Int.random(in: 1...12)
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct result?
    var correctResult: Int {
        return value1 / value2
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            HStack {
                Text("÷")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(value1)")
                        .bold()
                    Text("\(value2)")
                        .bold()
                }
            }
            
            Divider()
            
            HStack {
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    
                    //        CONDITION      true  false
                        .opacity(answerCorrect == true ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                    
                    //        CONDITION1         AND     CONDITION2         true  false
                    //       answerChecked = true     answerCorrect = false
                        .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                    
                    
                }
                Spacer()
                TextField("",
                          text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
            
            ZStack {
                
                Button(action: {
                    
                    // Answer has been checked!
                    answerChecked = true
                    
                    // Convert the input given to an integer, if possible
                    guard let resultGiven = Int(inputGiven) else {
                        // Sadness, not a number
                        answerCorrect = false
                        return
                    }
                    
                    // Check the answer!
                    if resultGiven == correctResult {
                        
                        // Celebrate! 👍🏼
                        answerCorrect = true
                    } else {
                        
                        // Sadness, they gave a number, but it's correct 😭
                        answerCorrect = false
                    }
                }, label: {
                    Text("Check Answer")
                        .font(.largeTitle)
                })
                
                    .padding()
                    .buttonStyle(.bordered)
                
                // Only show this button when an answer has not been checked
                    .opacity(answerChecked == false ? 1.0 : 0.0)
                
                Button(action: {
                    
                    // Generate a new question
                    value1 = Int.random(in: 1...12)
                    value2 = Int.random(in: 1...12)
                    
                    // Reset properties that track what's happening with the current question
                    answerChecked = false
                    answerCorrect = false
                    
                    // Reset the input field
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                // Only show this button when an answer has been checked
                    .opacity(answerChecked == true ? 1.0 : 0.0)
                
            }
            
            
            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 45))
        
        
    }
}

struct divisionView_Previews: PreviewProvider {
    static var previews: some View {
        divisionView()
    }
}
