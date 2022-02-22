//
//  ContentView.swift
//  DadJokes
//
//  Created by Russell Gordon on 2022-02-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            // The displayed dad joke
            Text("How do you organize a space party? You planet.")
                .multilineTextAlignment(.leading)
                .padding(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.primary, lineWidth: 4)
                )
                .padding(10)
            // Heart circle
           
                Image(systemName: "heart.circle")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor( .black)
           
            
            // Another one! button
            Button(action: {
                
                print("Button was pressed")
                
            }, label: {
                
                Text("Another One!")
            })
            
            .buttonStyle(.bordered)
            
            HStack{
                
                Text("Favourites")
                    .font(.title3)
                    .bold()
                
                // List
                List {
                    Text("Which side of the chicken has more feathers? The outside.")
                    Text("Why did the Clydesdale give the pony a glass of water? Because he was a little horse!")
                    Text("The great thing about stationery shops is they're always in the same place...")
                }
                
            }

            Spacer()
                        
        }
        .navigationTitle("icanhazdadjoke?")
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}