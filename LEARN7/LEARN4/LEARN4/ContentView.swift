//
//  ContentView.swift
//  LEARN4
//
//  Created by Nomura Rentaro on 2021/02/12.
//

import SwiftUI

struct ColorView: View, Identifiable {
    @State var id = UUID()
    @State var item:(Text, Text, Color)
    let width = UIScreen.main.bounds.size.width - 10
    var body: some View {
        TupleView(
            (
                item.0
                    .frame(width: width, alignment: .leading)
                    .font(.largeTitle)
                    .foregroundColor(item.2),
                
                item.1
                    .frame(width:width, alignment: .leading)
                    .font(.headline)
                    .foregroundColor(item.2),
                
                Divider()
            )
        )
    }
}

struct ContentView: View {
    let data = [
        ColorView(item:(Text("One"), Text("Oh! First Item!"), Color.red)),
        ColorView(item:(Text("Two"), Text("This is second item!"), Color.green)),
        ColorView(item:(Text("Three"), Text("It's last item!"), Color.blue)),
    ]
    
    var body: some View {
        Text("Tupple View")
            .font(.largeTitle)
        
        Divider()
        
        ForEach(data) {item in
            item
        }
        
        Spacer(minLength: 0)
    }
}

struct Contents_Preview: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
