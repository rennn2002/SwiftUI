//
//  ContentView.swift
//  LEARN17
//
//  Created by Nomura Rentaro on 2021/03/20.
//

import SwiftUI
import Foundation

class FireData: Codable, Identifiable {
    var id:Int
    let name:String
    let mail:String
    let age:Int
}

class FireService {
    let url:URL
    
    init(url:URL) {
        self.url = url
    }
    
    func getAllData(res: @escaping([FireData])->()) {
        URLSession.shared.dataTask(with:url) { data, response, error in
            let result = try!
            JSONDecoder().decode([FireData].self, from: data!)
            DispatchQueue.main.async {
                res(result)
            }
        }.resume()
    }
}

class FireModel: ObservableObject {
    let url:URL
    @Published var data = [FireData]()
    
    init() {
        url = URL(string:"https://tuyano-dummy-data.firebaseio.com/sample_data.json")!
        self.getData()
    }
    
    func getData() {
        FireService(url:self.url).getAllData { data in
            self.data = data
        }
    }
    
}

struct ContentView: View {
    
    @State var msg: String = "none"
    @ObservedObject var firemodel = FireModel()
    
    var body: some View {
           NavigationView {
                List(firemodel.data) { item in
                    NavigationLink(destination: DetailView(item: item)) {
                        VStack {
                            HStack {
                                VStack {
                                    Text(item.name)
                                        .font(.title)
                                        .frame(width: 200,height: 20, alignment: .leading)
                                        
                                    Spacer(minLength: 5)
                                        .fixedSize()
                                    Text(item.mail)
                                        .frame(width: 200, height:15, alignment: .leading)
                                        .foregroundColor(.gray)
                                }
                                    
                                Spacer()
                                    
                                Image("wolf")
                                    .resizable()
                                    .frame(width:50, height:50)
                            }
                        }.onTapGesture {
                            self.msg = "Tapped"
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct DetailView: View {
    
    var item: FireData
    
    var body: some View {
        VStack {
            Image("wolf")
                .resizable()
                .frame(width:150, height:150)
            
            Text(item.name)
                .font(.largeTitle)
            
            Spacer(minLength:5)
                .fixedSize()
            
            Text(item.mail)
                .font(.body)
                .foregroundColor(.gray)
            
            Spacer(minLength:0)
        }
    }
}

struct ContentView_Prevwiews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

