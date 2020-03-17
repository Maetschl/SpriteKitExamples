//
//  GameScene.swift
//  ScreenLocations
//
//  Created by Julian Arias Maetschl on 12-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        // Red cube at center of screen
        addChild(newCube())

        // Red cube at right of screen
        let redCube1 = newCube()
        redCube1.position.x = UIScreen.main.bounds.width
        addChild(redCube1)

        let some = SKSpriteNode(color: UIColor.green.withAlphaComponent(0.2), size: size)
        addChild(some)
    }

    func newCube() -> SKSpriteNode {
        return SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
    }

}

extension CGSize {
    static func * (left: CGSize, right: CGFloat) -> CGSize {
        return CGSize(width: left.width*right, height: left.height*right)
    }
}
