//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by om on 06/02/21.
//

import SwiftUI
struct ContentView: View
{
    @State private var userScore=0
    @State private var computerScore=0
    @State private var computerChoice:Int=Int.random(in:0..<3)
    @State private var allChoices=["Rock","Paper","Scissors"]
    @State private var showAlert:Bool=false
    @State private var AlertTitle:String=""
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                VStack(spacing:200)
                {
                    VStack(alignment:.leading,spacing:10)
                    {
                        Text("User score:\(userScore)")
                        .foregroundColor(.blue)
                    Text("Computer score:\(computerScore)")
                        .foregroundColor(.red)
                    }
                    .font(.largeTitle)
                    VStack()
                    {
                        Text("Choose")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .shadow(color:.black, radius:10)
                    }
                    HStack(spacing:26)
                    {
                        ForEach(0..<allChoices.count)
                        {
                            number in
                            Button(action:{logic(number)})
                            {
                                Text(allChoices[number]).foregroundColor(.black)
                            }
                                .alert(isPresented:$showAlert)
                            {
                                Alert(title:Text("\(AlertTitle)"), message:Text("Computer chose:\(allChoices[computerChoice])"), dismissButton:.default(Text("Play again"))
                                {
                                    computerChoice=Int.random(in:0..<3)
                                })
                            }
                        }
                    }
                    .font(.largeTitle)
                    Spacer()
                }
            }
        }
    }
    func logic(_ number:Int)
    {
        if number == computerChoice
        {
            AlertTitle="Tie!"
        }
        else if number > computerChoice && number-computerChoice != 2 || number-computerChoice == -2
        {
            AlertTitle="You Won!"
            userScore+=1
        }
        else
        {
            AlertTitle="You Lost!"
            computerScore+=1
        }
        showAlert=true
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
