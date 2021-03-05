//
//  ContentView.swift
//  LEARN11
//
//  Created by Nomura Rentaro on 2021/03/04.
//

import SwiftUI

struct ContentView: View {
    
    @State var flgAlert:Bool = false
    @State var flgActionSheet:Bool = false
    @State var flgPopover:Bool = false
    @State var msgAlert:String = ""
    @State var msgActionSheet:String = ""
    
    var body: some View {
        VStack {
            Group {
                Button(action: {self.flgAlert.toggle()}) {
                    Text("Alert Button")
                        .frame(width:110, height: 30)
                        .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue)
                                )
                        .alert(isPresented: $flgAlert, content: {
                            Alert(title: Text("Alert!"),
                            message: Text("This is alert message"),
                            primaryButton: .default(Text("OK"), action: {
                                print("OK")
                                self.msgAlert = "action successfully performed"
                            }),
                            secondaryButton: .cancel(Text("Cancel"), action: {
                                print("cancel")
                                self.msgAlert = "action attempted but canceled"
                            })
                            )}
                        )}
                Divider()
                Text(flgAlert ? "showing":"hidden")
                    .font(.title)
                    .foregroundColor(Color.gray)
                Divider()
                
                Text(self.msgAlert)
            }
            
            Spacer(minLength: 50)
                .fixedSize()
            
            Group {
                Button(action: {self.flgActionSheet.toggle()}) {
                    Text("ActionSheet Button")
                        .frame(width:170, height:30)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue)
                        )
                        .actionSheet(isPresented: $flgActionSheet) {
                            ActionSheet(title: Text("Action"),
                            message: Text("This is actionSheet"), buttons: [
                            .default(Text("OK"), action: {
                                self.msgActionSheet = "OK pressed"
                                }),
                            .destructive(Text("cancel pressed"), action: {
                                self.msgActionSheet = "cancel pressed"
                                })
                            ])
                        }
                    }
                
                Divider()
                Text(flgActionSheet ? "showing" : "hidden")
                    .font(.title)
                    .foregroundColor(.gray)
                Divider()
                
                Text(self.msgActionSheet)
            }
            
            Spacer(minLength: 50)
                .fixedSize()
            Group {
                Button(action: {self.flgPopover.toggle()}) {
                    Text("PopoverButton")
                        .frame(width: 120, height: 30)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue)
                        )
                        .popover(isPresented: $flgPopover, arrowEdge: .bottom) {
                            VStack {
                                Text("Popover")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                Spacer(minLength: 20)
                                    .fixedSize()
                                Text("This is popover")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Divider()
                                Button(action: {self.flgPopover = false}) {
                                    Text("close")
                                        .font(.headline)
                                        .frame(width: 100, height: 50)
                                        .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue)
                                        )
                                }
                                Spacer(minLength: 0)
                            }
                        }
                    }
                Divider()
                Text(flgPopover ? "shown":"hidden")
                    .font(.title)
                    .foregroundColor(.blue)
                Divider()
                }
            Spacer(minLength: 0)
        }
    }
}
 
struct DetailView: View {
    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
