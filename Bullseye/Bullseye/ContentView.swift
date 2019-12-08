//
//  ContentView.swift
//  Bullseye
//
//  Created by Elisha Limanu on 02/12/19.
//  Copyright © 2019 Elisha Limanu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isAlertVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100 )
    @State var totalScore: Int = 0
    @State var round: Int = 1
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(ShadowStyle())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(ShadowStyle())
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct ShadowStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
               .foregroundColor(Color.black)
               .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
               .foregroundColor(Color.black)
               .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack{
                Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            
            // Slider row
            HStack{
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue , in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            
            Spacer()
            
            // Button row
            HStack {
                Button(action: {
                    print("Button pressed!")
                    self.isAlertVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit me"/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $isAlertVisible) { () ->
                    Alert in
                    let roundedValue: Int = Int(sliderValue.rounded())
                    return Alert(
                        title: Text("\(alertTitle())"),
                        message: Text(
                            "The slider value is \(roundedValue).\n" +
                            "You scored \(pointsForCurrentRound()) points this round."
                        ),
                        dismissButton: .default(Text("Awesome!")) {
                            self.totalScore += self.pointsForCurrentRound()
                            
                            self.round += 1
                            self.target = Int.random(in: 1...100)
                        }
                    )
                }
                .background(Image("Button"))
                .modifier(ButtonLargeTextStyle())
            }
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start over")
                    }
                }
                .background(Image("Button"))
                .modifier(ButtonSmallTextStyle())
                
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(totalScore)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                
                Button(action: {
                    print("Info!")
                }) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info")
                    }
                }
                .background(Image("Button"))
                .modifier(ButtonSmallTextStyle())
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func theDifference() -> Int {
        return abs(sliderValueRounded() - target)
    }
    
    func pointsForCurrentRound() -> Int {
        var points:Int = 100 - theDifference()
        
        // bonus if the player get perfect score
        if(points == 100) {
            points += 100
        } else if (points == 99) {
            points += 50
        }
        return points
    }
    
    
    func alertTitle() -> String {
        let difference: Int = theDifference()
        let title: String
        if (difference == 0) {
            title = "Perfect!"
        }
        else if difference < 5 {
            title = "You almost had it!"
        }
        else if difference <= 10 {
            title = "Not bad"
        }
        else {
            title = "Are you even try?"
        }
        return title
    }
    
    func resetGame() {
        totalScore = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
