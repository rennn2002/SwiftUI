//
//  ContentView.swift
//  LEARN12
//
//  Created by Nomura Rentaro on 2021/03/05.
//

import SwiftUI

struct ContentView: View {
    @State var flg:Bool = false
    @State var onOpacity:Bool = false
    @State var animeFlg:Bool = false
    @State var animeToggle:Bool = false
    @State var animeMsg:String = "Opacity"
    
    var body: some View {
        VStack {
            Group {
                Text("Select animation button")
                    .font(.title)
                Divider()
                Button(action: {self.flg.toggle()}) {
                    Text("Button")
                        .font(.title)
                        .frame(width:120, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue)
                        )
                        .popover(isPresented: $flg, arrowEdge: .bottom) {
                            VStack {
                                Text("popover")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                Spacer(minLength: 20)
                                    .fixedSize()
                                Text("Please select transition animation")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Divider()
                                Button(action: {self.animeToggle = true}) {
                                    Text("scale")
                                        .font(.title)
                                        .frame(width:90, height:40)
                                        .foregroundColor(.black)
                                        .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black)
                                        )
                                }
                                Divider()
                                Button(action: {self.animeToggle = false}) {
                                    HStack {
                                        Text("opacity")
                                            .font(.title)
                                            .frame(width:100, height:40)
                                            .foregroundColor(.black)
                                            .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black)
                                        )
                                        Text("default is opacity")
                                            .foregroundColor(.black)
                                    }
                                }
                                Divider()
                                Button(action: {self.flg = false}) {
                                    Text("close")
                                        .font(.title)
                                        .frame(width:90, height:40)
                                        .foregroundColor(.red)
                                        .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.red)
                                        )
                                }
                        }
                    }
                }
            }
            Divider()
            Group {
                Text(self.animeToggle ? "scale":"opacity")
                    .font(.title)
                
                Divider()
                
                Button("Please Tap", action: {
                    withAnimation {
                        self.animeFlg.toggle()
                    }
                })
                .font(.headline)
                .frame(width:300, height:50)
                .border(Color.blue, width: 3.0)
                
                Divider()
                    
                if self.animeFlg {
                    Text("TRANSITION")
                        .font(.headline)
                        .frame(width:300, height:50)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .transition(self.animeToggle ? .scale:.opacity)
                }
            }
            Spacer(minLength: 0)
        }
    }
}

struct content_previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
