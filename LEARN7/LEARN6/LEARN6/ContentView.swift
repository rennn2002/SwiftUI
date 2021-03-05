//
//  ContentView.swift
//  LEARN6
//
//  Created by Nomura Rentaro on 2021/03/02.
//

import SwiftUI

struct MyView: View, Identifiable {
    @State var id = UUID()
    @State var msg: String
    @State var item: AnyView
    let width = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack {
            Text(msg)
                .font(.title)
                .frame(width: width, height: 30, alignment: .center)
                .padding(10)
            
            item.frame(width: width, height: 30, alignment: .center)
                .padding(10)
            
            Divider()
        }
    }
}

struct ContentView: View {
    @State var sec: String = ""
    @State var thd: Float = 50.0
    
    var body: some View {
        Text("Any View")
            .font(.largeTitle)
        
        Divider()
        
        MyView(msg: "First", item: AnyView(Text("This is first item")))
        MyView(msg: "Second", item: AnyView(TextField("second", text: $sec).textFieldStyle(RoundedBorderTextFieldStyle())))
        MyView(msg: "Third", item: AnyView(Slider(value: $thd, in: 0...100)))
        
        Spacer(minLength: 0)
    }
}

struct ContentPreviw: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
