//
//  ContentView.swift
//  LEARN10
//
//  Created by Nomura Rentaro on 2021/03/03.
//

import SwiftUI

struct ContentView: View {
    let circleSize:CGFloat = 100.0
    
    var body: some View {
        GeometryReader { geo in
            Circle()
                .size(CGSize(width:self.circleSize, height: self.circleSize))
                .offset(x:0, y:0)
                .fill(Color.red)
            
            Circle()
                .size(CGSize(width:self.circleSize, height: self.circleSize))
                .offset(x:0, y:geo.size.height - self.circleSize)
                .fill(Color.green)
            
            Circle()
                .size(CGSize(width:self.circleSize, height: self.circleSize))
                .offset(x:geo.size.width - self.circleSize, y:0)
                .fill(Color.yellow)
            
            Circle()
                .size(CGSize(width:self.circleSize, height: self.circleSize))
                .offset(x:geo.size.width - self.circleSize, y:geo.size.height - self.circleSize)
                .fill(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
