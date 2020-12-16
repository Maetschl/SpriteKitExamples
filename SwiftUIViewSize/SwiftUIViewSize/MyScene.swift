//
//  MyScene.swift
//  SwiftUIViewSize
//
//  Created by Julian Arias Maetschl on 16-12-20.
//

import SpriteKit

class MyScene: SKScene {

    override func didMove(to view: SKView) {
        print(view.frame)
    }

    override func didChangeSize(_ oldSize: CGSize) {
        print(#function)
        print(oldSize)
        print(self.size)
    }

}
