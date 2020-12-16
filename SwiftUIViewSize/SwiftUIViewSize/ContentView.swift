//
//  ContentView.swift
//  SwiftUIViewSize
//
//  Created by Julian Arias Maetschl on 16-12-20.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        SpriteView(scene: SKScene(fileNamed: "MyScene")!)
            .frame(width: 300, height: 400).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
