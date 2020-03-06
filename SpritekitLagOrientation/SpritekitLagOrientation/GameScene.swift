//
//  GameScene.swift
//  SpritekitLagOrientation
//
//  Created by Julian Arias Maetschl on 05-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        let mySquare = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
        mySquare.fillColor = SKColor.blue
        mySquare.lineWidth = 1

        mySquare.position = CGPoint(x: 0, y: 0)
        self.addChild(mySquare)
self.run(
    SKAction.repeatForever(
        SKAction.customAction(withDuration: 0.0, actionBlock: { (_, _) in
            // Create and add new node...
        })
    )
)
    }

    override func update(_ currentTime: TimeInterval) {
        <#code#>
    }
}
