//
//  ContentView.swift
//  LEARN7
//
//  Created by Nomura Rentaro on 2021/03/02.
//

import SwiftUI

struct ContentView: View {
    @State var  z = [1.0, 2.0, 3.0]
    @State var currnetPos: CGPoint = CGPoint(x: 100, y: 100)
    @State var sel = -1
    
    let data:[(CGFloat, CGFloat)] = [
        (100, 100),
        (125, 150),
        (150, 200),
        (175, 250),
        (200, 300),
        (225, 350),
        (250, 400),
    ]
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .stroke(lineWidth:self.sel == 0 ? 5.0 : 0.0)
                    .background(Color.red)
                    .frame(width: 200, height: 200)
                    .position(x: 100, y: 100)
                    .zIndex(z[0])
                    .onTapGesture {
                        self.z = [3.0, 2.0, 1.0]
                        self.sel = 0
                }
                Rectangle()
                    .stroke(lineWidth:self.sel == 1 ? 5.0 : 0.0)
                    .background(Color.green)
                    .frame(width: 200, height: 200)
                    .position(x: 200, y: 200)
                    .zIndex(z[1])
                    .onTapGesture {
                        self.z = [1.0, 3.0, 2.0]
                        self.sel = 1
                }
                Rectangle()
                    .stroke(lineWidth:self.sel == 2 ? 5.0 : 0.0)
                    .background(Color.blue)
                    .frame(width: 200, height: 200)
                    .position(x: 300, y: 300)
                    .zIndex(z[2])
                    .onTapGesture {
                        self.z = [1.0, 2.0, 3.0]
                        self.sel = 2
                }
            }
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                    .position(x: self.currnetPos.x, y: self.currnetPos.y)
            }.gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    self.currnetPos = value.location
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
