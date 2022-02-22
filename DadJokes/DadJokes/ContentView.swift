//
//  ContentView.swift
//  DadJokes
//
//  Created by Russell Gordon on 2022-02-21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    @State var currentJoke: DadJoke = DadJoke(id: "", joke: "", status: 0)
    
    // MARK: Computed Properties
    
    var body: some View {
        
        // MARK: UI
        VStack {
            
            // The displayed dad joke
            Text(currentJoke.joke)
                .multilineTextAlignment(.leading)
                .padding(30)
                .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary, lineWidth: 4))
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
                
                Spacer()
                
            }

            // List
            List {
                Text("Which side of the chicken has more feathers? The outside.")
                Text("Why did the Clydesdale give the pony a glass of water? Because he was a little horse!")
                Text("The great thing about stationery shops is they're always in the same place...")
            }
        }
        
        // MARK: Task
        .task{
            
            //Assemble url
            let url = URL(string: "https://icanhazdadjoke.com/")!
            
            //Define data type
            //configure request to web site
            var request = URLRequest(url: url)
            
            //Ask for json
            request.setValue("appliction/json", forHTTPHeaderField: "Accept")
            
            //Start session to interact with the endpoint
            let urlSession = URLSession.shared
            
            //Attempt to fetch new joke
            //Possible do-catch result
            do {
                
                //retreve raw data from endpoint
                let (data, _) = try await urlSession.data(for: request)
                
                //Attept at decode data to swift struct
                //takes the data and trys to apply it to "currentJoke"
                currentJoke = try JSONDecoder().decode(DadJoke.self, from: data)
                
            } catch {
                
                print("Failed to retreive or decode the JSON from endpoint.")
                // Print the errored code
                print(error)
            }
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
