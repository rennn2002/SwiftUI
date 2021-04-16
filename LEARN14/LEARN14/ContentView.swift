//
//  ContentView.swift
//  LEARN14
//
//  Created by Nomura Rentaro on 2021/03/11.
//

import SwiftUI

struct ContentView: View {
    @State var scaleRed:CGFloat = 1.0
    @State var scaleBlue:CGFloat = 0.5
    @State var slideVal:Double = 1.0
    
    var body: some View {
        VStack {
            Text("Animation")
                .font(.title)
            
            Divider()
            
            ZStack {
                Circle()
                    .size(width: 200, height: 200)
                    .offset(x: -100, y: -100)
                    .scale(scaleRed, anchor:.zero)
                    .offset(x:200, y:100)
                    .fill(Color.red)
                    .onAppear {
                        let animRed = Animation
                            .easeInOut(duration: 1)
                            .repeatForever(autoreverses: true)
                            .speed(Double(slideVal))
                        return withAnimation(animRed) { //create structure of animation and return
                            self.scaleRed = 0.5
                    }
                }
            }
            ZStack {
                Circle()
                    .size(width:200, height: 200)
                    .offset(x: -100, y: -100)
                    .scale(scaleBlue, anchor:.zero)
                    .offset(x:200, y:100)
                    .fill(Color.blue)
                    .onAppear {
                        let animBlue = Animation
                            .easeInOut(duration: 1)
                            .repeatForever(autoreverses:true)
                        return withAnimation(animBlue) {
                            self.scaleBlue = 1
                    }
                }
            }
            Text(String(slideVal))
            
            Slider(value: self.$slideVal, in:1.0...5.0, step:1.0)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
