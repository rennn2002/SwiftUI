//
//  ContentView.swift
//  LEARN18
//
//  Created by Nomura Rentaro on 2021/03/21.
//

import SwiftUI

class PicsumService {
    
    func getData(id:Int , res: @escaping(UIImage)->()) {
        let url = URL(string:"https://picsum.photos/id/\(id)/200/200")!
        
        URLSession.shared.dataTask(with:url) { data, response, error in
            
            let result = UIImage(data: data!)
            
            DispatchQueue.main.async {
                res(result!)
            }
        }.resume()
    }
}

class PicsumModel: ObservableObject {
    @Published var data = UIImage()
    
    func getData(id:Int) {
        PicsumService().getData(id: id) { data in
            self.data = data
        }
    }
}

struct ContentView: View {
    @State var msg = "Picsum data"
    @State var pic_id: Int = 1
    @ObservedObject var picsummodel = PicsumModel()
    
    init() {
        picsummodel.getData(id: pic_id)
    }
    
    var body: some View {
        VStack {
            
            Text(msg)
                .font(.title)
            
            Divider()
            
            Stepper("set ID: \(pic_id)", onIncrement: {
                self.pic_id += 1
                self.picsummodel.getData(id: pic_id)
            }, onDecrement: {
                self.pic_id -= 1
                if self.pic_id < 1 {
                    self.pic_id = 1
                }
                self.picsummodel.getData(id: pic_id)
            }).padding(5)
            
            Divider()
            
            Image(uiImage: picsummodel.data)
            
            Spacer(minLength:0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
