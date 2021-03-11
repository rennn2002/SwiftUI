//
//  ContentView.swift
//  LEARN13
//
//  Created by Nomura Rentaro on 2021/03/11.
//

import SwiftUI

struct ContentView: View {
    @State var flg = false
    @State var msg = "move to RIGHT"
    @State var flgAnime = false
    @State var scale:CGFloat = 1.0
    
    var body: some View {
        VStack {
            ZStack()f
            Divider()
            Text(self.msg)
                .font(.title)
            
            Divider()
            
            ZStack {
                Button(action: {self.flg.toggle()
                    self.msg = self.flg ? "DROP DOWN" : "move to RIGHT"
                }) {
                    Text("Please tap!")
                        .font(.headline)
                        .frame(width: 300, height:50)
                        .border(Color.blue, width:3.0)
                }.offset(x:-30)
                Toggle(isOn: self.$flgAnime) {
                    Text("")
                }.offset(x:-20)
            }
            
            Divider()
            
            ZStack {
                Path{path in
                    path.move(to:CGPoint(x:-100, y:-25))
                    path.addLine(to:CGPoint(x:100, y:-25))
                    path.addLine(to:CGPoint(x:100, y:-50))
                    path.addLine(to:CGPoint(x:150, y:0))
                    path.addLine(to:CGPoint(x:100, y:50))
                    path.addLine(to:CGPoint(x:100, y:25))
                    path.addLine(to:CGPoint(x:-100, y:25))
                    path.closeSubpath()
                }
                .rotation(Angle(degrees: self.flg ? 90 : 0), anchor: .zero)
                .offset(x: 200, y: self.flg ? 150 : 50)
                .fill(self.flg ? Color.yellow : Color.blue)
                .animation(self.flgAnime ? Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5) : .default)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
