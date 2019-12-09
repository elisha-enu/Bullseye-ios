//
//  AboutView.swift
//  Bullseye
//
//  Created by Elisha Limanu on 09/12/19.
//  Copyright © 2019 Elisha Limanu. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    let vstackBg = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.bottom, 20)
                .padding(.top, 20)
        }
    }
    
    struct TextViewStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        Group{
            VStack{
                Text("🎯 Bullseye").modifier(HeadingStyle())
                Text("🎯 This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(TextViewStyle()).lineLimit(nil)
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score").modifier(TextViewStyle()).lineLimit(nil)
                Text("Enjoy!").modifier(TextViewStyle())
            }
            .navigationBarTitle("About Bullsye")
            .background(vstackBg)
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
