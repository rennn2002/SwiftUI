//
//  ContentView.swift
//  LEARN19
//
//  Created by Nomura Rentaro on 2021/03/21.
//

import SwiftUI

class TextFileService {
    let fname: String
    let path:URL
    
    init(filename:String) {
        self.fname = filename
        let dir = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first
        path = dir!.appendingPathComponent(fname)
    }
    
    func getText()->String {
        var result = "no data"
        do {
            result = try String(contentsOf: path, encoding: String.Encoding.utf8)
        } catch {
            result = "can't get data"
        }
        return result
    }
    
    func setText(data:String)->Void {
        try! data.write(
            to: path, atomically: false,
            encoding: String.Encoding.utf8
        )
    }
}

class TextFileModel: ObservableObject {
    @Published var data: String
    let service:TextFileService
    
    init(filename: String) {
        data = String()
        service = TextFileService(filename: filename)
        self.load()
    }
    
    func load() {
        self.data = service.getText()
    }
    
    func save() {
        service.setText(data: self.data)
    }
}

struct ContentView: View {
    @State var msg: String = "Plain text"
    @ObservedObject var textmodel = TextFileModel(filename:"sample.txt")
    
    var body: some View {
        VStack {
            
            Text(self.msg)
                .font(.title)
            
            Divider()
            
            TextField("load data", text: $textmodel.data)
                .font(.body)
                .padding(10)
            
            Divider()
            
            Button("save data", action: {
                self.textmodel.save()
                self.msg = "saved..."
            }).font(.headline)
            .frame(width:300, height:50)
            .border(Color.blue)
            
            Divider()
            
            Spacer(minLength: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
