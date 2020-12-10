//
//  GameScene.swift
//  SpriteResize
//
//  Created by Julian Arias Maetschl on 04-06-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let texture = SKTexture(imageNamed: "blackRing2")

        let node = SKSpriteNode(texture: texture)


        node.scale(to: CGSize(width: 70, height: 70))
        addChild(node)
    }

}
