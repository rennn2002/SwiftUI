//
//  ContentView.swift
//  LEARN9
//
//  Created by Nomura Rentaro on 2021/03/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           
            HStack {
                Image("1")
                    .resizable()
                    .frame(width:180, height:180)
                    .clipShape(Circle())
                    .shadow(color:Color.white, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:10, y: 10)
                    .overlay(Circle().stroke(Color.white, lineWidth:3))
                    .position(x:100, y:100)
                
                Image("2")
                    .resizable()
                    .frame(width:180, height:180)
                    .clipShape(Circle())
                    .position(x:100, y:100)
            }
            HStack {
                Image("3")
                    .resizable()
                    .frame(width:180, height:180)
                    .clipShape(Circle())
                    .position(x:100, y:30)
                
                Image("4")
                    .resizable()
                    .frame(width:180, height:180)
                    .clipShape(Circle())
                    .position(x:100, y:30)
            }
            HStack {
                Image("5")
                    .resizable()
                    .frame(width:180, height:180)
                    .clipShape(Circle())
                    .position(x:100, y:-40)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
