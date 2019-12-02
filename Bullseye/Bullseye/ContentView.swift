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
    
    var body: some View {
        VStack {
            Text("Welcome to my first app ")
                .fontWeight(.semibold)
                .foregroundColor(.red)
            Button(action: {
                print("Button pressed!")
                self.isAlertVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $isAlertVisible) { () ->
                Alert in
                return Alert(
                    title: Text("Hello There!"),
                    message: Text("This s my first pop up"),
                    dismissButton: .default(Text("Awesome!"))
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
