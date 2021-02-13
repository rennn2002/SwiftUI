//
//  ContentView.swift
//  LEARN3
//
//  Created by Nomura Rentaro on 2021/02/10.
//
import SwiftUI

struct ItemView: View, Identifiable {
    
    var id:Int
    let msg:String
    let c:Color
    
    var body: some View {
        HStack {
            Text(String(self.id))
                .font(.largeTitle)
                .frame(width:75, height: 75)
                .foregroundColor(Color.white)
                .background(c)
            Text(self.msg)
                .font(.title)
                .padding(10)
                .foregroundColor(c)
        }
    }
}

struct DeteilView: View, Identifiable {
    let id = UUID()
    let item:ItemView
    
    var body: some View {
        VStack {
            Divider()
            Text("No, '\(item.id)'")
                .font(.largeTitle)
                .padding(20)
            Group {
                Text(item.msg)
                    .font(.title)
                    .padding(10)
                
                Spacer(minLength: 0)
            }.frame(width: UIScreen.main.bounds.size.width)
            .background(item.c)

        }.background(Color.white)
    }
}

struct ContentView: View {
    @State var data = [
        DeteilView(item: ItemView(id:1, msg: "Red", c:Color.red)),
        DeteilView(item: ItemView(id:2, msg: "Green", c:Color.green)),
        DeteilView(item: ItemView(id:3, msg: "Blue", c:Color.blue))
    ]
    
    var body: some View {
        VStack {
            Text("selectrd: '\(data[self.data.count - 1].item.msg)'.")
                .font(.largeTitle)
            ZStack{
                ForEach(data) {item in
                    item
                }
            }
            Button(action: {
                let ob = self.data.popLast()
                self.data.insert(ob!, at: 0)
            }) {
                Text("Button")
                    .font(.title)
            }
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
