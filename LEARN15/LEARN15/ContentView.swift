//
//  ContentView.swift
//  LEARN15
//
//  Created by Nomura Rentaro on 2021/03/13.
//

import SwiftUI
import Foundation

class LoremService {
    let url:URL = URL(string:"https://loripsum.net/api/plaintext")!
    
    func getText(res: @escaping(String)->()) {
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            DispatchQueue.main.async {
                res(String(data: data!, encoding: String.Encoding.utf8)!)
            }
        }.resume()
    }
}

class LoremModel: ObservableObject {
    @Published var data = String()
    
    init() {
        self.getData()
    }
    
    func getData() {
        LoremService().getText { data in
            self.data = data
        }
    }
}

struct ContentView: View {
    @State var msg = "plain text."
    @ObservedObject var loremmodel = LoremModel()
    
    var body: some View {
        VStack {
            Text(msg)
                .font(.title)
            
            Divider()
            
            Text(loremmodel.data)
                .font(.body)
                .padding(10)
            
            Divider()
            
            Spacer(minLength: 0)
        }
    }
}

struct ContetnView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
