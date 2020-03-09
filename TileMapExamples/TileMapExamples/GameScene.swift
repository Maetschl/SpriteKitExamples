//
//  GameScene.swift
//  TileMapExamples
//
//  Created by Julian Arias Maetschl on 08-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    private var tileMap : SKTileMapNode!
    
    override func didMove(to view: SKView) {
        self.tileMap = childNode(withName: "tileMap") as? SKTileMapNode
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        var color: SKColor = .black
        let tileRowIndex = tileMap.tileRowIndex(fromPosition: pos)
        let tileColumnIndex = tileMap.tileColumnIndex(fromPosition: pos)
        debugPrint("Click on: \(tileRowIndex),\(tileColumnIndex)")
        if tileMap.contains(pos) {
            // red
        } else {
            color = .white
        }
        let node = SKSpriteNode(color: color, size: CGSize(width: 15, height: 15))
        node.position = pos
        addChild(node)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
