//
//  ContentView.swift
//  LEARN16
//
//  Created by Nomura Rentaro on 2021/03/19.
//

import SwiftUI

struct FireData: Codable, Identifiable {
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
    
    func getAllData(res: @escaping ([FireData])->()) {
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
    @State var msg = "JSON Data"
    @ObservedObject var firemodel = FireModel()
    
    var body: some View {
        VStack {
            Text(msg)
                .font(.title)
            
            Divider()
            
            Button("get data", action: {
                self.msg = "data: \(self.firemodel.data.count)"
            })
            .font(.headline)
            .frame(width:300, height:50)
            .border(Color.blue, width:3.0)
            
            Divider()
            
            List(firemodel.data) { item in
                VStack {
                    Text("\(item.name)[\(item.age)]")
                        .font(.headline)
                        .frame(width:200, height: 30, alignment: .leading)
                    
                    Text(item.mail)
                        .font(.headline)
                        .frame(width: 200, height: 15, alignment: .leading)
                    
                    Spacer(minLength: 5).fixedSize()
                }
            }
            Spacer(minLength: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
