//
//  ContentView.swift
//  LEARN8
//
//  Created by Nomura Rentaro on 2021/03/03.
//

import SwiftUI

struct CP: Hashable {
    var colorState:Bool
    let x:CGFloat
    let y:CGFloat
}
struct CP2:Hashable {
    var id = UUID()
    let x:CGFloat
    let y:CGFloat
}

struct ContentView: View {
    @State var data:[CP] = []
    @State var pos:[CP2] = []
    @State var isEnd = false
    @State var c = Color.red
    @GestureState var isLP = false
    
    @State var colorState = true
    @State var colorState2 = true
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .fill(colorState ? Color.red : Color.blue)
                    .frame(width: 100, height: 100)
                    .opacity(0.25)
                    .position(x: 50, y: 50)
                ForEach(data, id:\.self) {ob in
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(ob.colorState ? Color.red : Color.black)
                        .opacity(0.25)
                        .position(x: ob.x, y: ob.y)
                }
            }.gesture(
            TapGesture(count: 2).onEnded { val in
                if colorState == true{
                    colorState = false
                }else {
                    colorState = true
                }
            })
            
            .gesture(DragGesture(minimumDistance: 0).onEnded { value in
                self.data.append(CP(colorState: true, x:value.location.x, y:value.location.y))
            })
            
            Group {
                Circle()
                    .fill(colorState2 ? Color.red : Color.blue)
                    .frame(width: 100, height: 100)
                    .opacity(0.25)
                    .position(x: 50, y: 200)
                ForEach(pos, id:\CP2.id) {ob in
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.blue)
                        .opacity(0.25)
                        .position(x: ob.x, y: ob.y)
                }
            }.gesture(
                TapGesture(count: 2).onEnded { val in
                    if colorState2 == true{
                        colorState2 = false
                    }else {
                        colorState2 = true
                    }
                })
            
            .gesture(DragGesture(minimumDistance: 0).onEnded { value in
                self.pos.append(CP2(x:value.location.x, y:value.location.y))
            })
            Circle()
                .fill(self.isEnd ? Color.yellow : Color.red)
                .frame(width: 100, height: 100)
                .position(x:50, y:350)
                .opacity(self.isLP ? 0.25 : 1.0)
                .gesture(
                    LongPressGesture(minimumDuration:1)
                        .updating($isLP) { currentState, gestureState, transaction in
                            gestureState = currentState
                        }
                        .onEnded { val in
                            self.isEnd.toggle()
                        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
