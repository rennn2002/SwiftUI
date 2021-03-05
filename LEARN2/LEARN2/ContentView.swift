//
//  ContentView.swift
//  LEARN2
//
//  Created by Nomura Rentaro on 2021/02/10.
//

import SwiftUI

struct ItemView: View, Identifiable {
    var id = UUID()
    var num:Int
    var msg:String
    var color:Color
    var icon:String
    
    var body: some View {
        Text(msg)
            .font(.largeTitle)
            .foregroundColor(color)
    }
}

struct DetailView: View {
 
    @Binding var selectedTab:Int
    var item:ItemView

   
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section {
                        Text(String(selectedTab))
                    }
                    Section {
                        Text(item.icon)
                            .font(.system(size: 170))
                    }
                }
            }.navigationBarTitle(Text("Select your Data"))
        }
    }
}

struct ContentView: View {

    @State var selectedTab = 0
    
    var data = [
        ItemView(num:1, msg:"Apple", color:.red, icon:"🍎"),
        ItemView(num:2, msg:"Banana", color:.yellow, icon:"🍌"),
        ItemView(num:3, msg:"Melon", color:.green, icon:"🍈")
    ]

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(data) {item in
                    DetailView(selectedTab: self.$selectedTab, item: item)
                        .tabItem {
                            Text(String(item.icon))
                                .font(.system(size: 170))
                        }.tag(item.num)
                }
            }
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
