//
//  GameScene.swift
//  StateMachineAnimation
//
//  Created by Julian Arias Maetschl on 18-04-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    private var player: SKSpriteNode?

    var playerStateMachine: GKStateMachine?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.player = self.childNode(withName: "Player") as? SKSpriteNode

        if let player = player {

            self.playerStateMachine = GKStateMachine(states: [
                PlayerRunning(player),
                PlayerJumping(player)
            ])

        }

        self.playerStateMachine?.enter(PlayerRunning.self)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.playerStateMachine?.currentState is PlayerRunning {
            self.playerStateMachine?.enter(PlayerJumping.self)
        } else {
            self.playerStateMachine?.enter(PlayerRunning.self)
        }
    }

}

class PlayerRunning: GKState {

    unowned var player: SKSpriteNode?

    init(_ player: SKSpriteNode) {
        self.player = player
    }

    override func didEnter(from previousState: GKState?) {
        self.player?.removeAllActions()
        self.player?.position = .zero
        self.player?.color = .red
        self.player?.run(SKAction.repeatForever(SKAction.rotate(byAngle: -1.0, duration: 0.5)))
    }

}

class PlayerJumping: GKState {

    unowned var player: SKSpriteNode?

    init(_ player: SKSpriteNode) {
        self.player = player
    }

    override func didEnter(from previousState: GKState?) {
        self.player?.removeAllActions()
        self.player?.position = .zero
        self.player?.color = .green
        let jump = SKAction.move(by: CGVector(dx: 0, dy: 100), duration: 1.0)
        self.player?.run(SKAction.repeatForever(SKAction.sequence([jump, jump.reversed()])))
    }

}
