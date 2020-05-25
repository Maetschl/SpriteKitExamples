//
//  GameScene.swift
//  CenterTileMap
//
//  Created by Julian Arias Maetschl on 25-05-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var tileMap : SKTileMapNode?
    
    override func didMove(to view: SKView) {
        self.tileMap = self.childNode(withName: "ExampleTileMap") as? SKTileMapNode
        self.tileMap?.anchorPoint = .zero
        self.tileMap?.position = CGPoint(x: 0 - self.frame.size.width/2, y: 0 - self.frame.size.height/2)
    }

}
