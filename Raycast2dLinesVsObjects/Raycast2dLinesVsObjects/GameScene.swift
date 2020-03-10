//
//  GameScene.swift
//  Raycast2dLinesVsObjects
//
//  Created by Julian Arias Maetschl on 10-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var player: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        self.player = self.childNode(withName: "Player") as? SKSpriteNode
    }
    
    
    func touchDown(atPoint pos: CGPoint) {
        let playerPosition = self.player.position
        let clickPosition = pos

        self.physicsWorld.enumerateBodies(alongRayStart: playerPosition, end: clickPosition) { body, point, vector, object in
            if let node = body.node as? SKSpriteNode {
                node.color = SKColor.red.withAlphaComponent(0.2)
                let pointNode = SKSpriteNode(color: .cyan, size: CGSize(width: 5, height: 5))
                pointNode.position = point
                let path = CGMutablePath()
                path.move(to: playerPosition)
                path.addLine(to: clickPosition)
                path.closeSubpath()
                let line = SKShapeNode(path: path)
                line.strokeColor = .green
                line.fillColor = .green
                self.addChild(line)
                self.addChild(pointNode)
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }

}
