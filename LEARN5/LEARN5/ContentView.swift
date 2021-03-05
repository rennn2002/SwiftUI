//
//  ContentView.swift
//  LEARN5
//
//  Created by Nomura Rentaro on 2021/02/15.
//

import SwiftUI

struct DatabaseView: View, Identifiable {
    
    let id = UUID()
    let userName: String
    let message: String
    let color: Color
    let age: Int
    let status: Bool
    
    var body: some View {
        VStack {
            
            Text(self.userName)
                .font(.largeTitle)
            Text(self.message)
                .font(.headline)
            
            Text(String(self.age))
            
            Text("status: \(self.status ? "No":"Yes")")
            
        }.background(self.color)
    }
    
}

struct DetailView: View{
    
    var Database: DatabaseView
    var body: some View {
        Text("Detail")
    }
}

struct ContentView: View {
    
    var myData = [
        DatabaseView(userName:"Ren", message:"hello!", color:Color.red, age:18, status: true),
        DatabaseView(userName:"Keigo", message:"hi!", color:Color.yellow, age:15, status: false)
    ]
    var body : some View {
        VStack {
            List(myData) {item in
                item
            }
        }
    }
    
}

struct Content_Previews: PreviewProvider {
    
    static var previews:some View {
        ContentView()
        
    }
}

