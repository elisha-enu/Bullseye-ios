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
    @State var randomNumber: Int = Int.random(in: 1...100 )
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack{
                Text("Put the bullseye as close as you can to: ")
                Text("\(self.randomNumber)")
            }
            Spacer()
            
            // Slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue , in: 1...100)
                Text("100")
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
                    let roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(
                        title: Text("Hello There!"),
                        message: Text("The slider value is \(roundedValue)"),
                        dismissButton: .default(Text("Awesome!"))
                    )
                }
            }
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    print("Button pressed!")
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {
                    print("Info!")
                }) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
