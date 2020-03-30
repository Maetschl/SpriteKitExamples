//
//  GameScene.swift
//  FpsTest
//
//  Created by Julian Arias Maetschl on 29-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {
        
        self.setUpScene()
    }

    func setUpScene() {
        for _ in 1...1000 {
            let position = CGPoint(
                x: .random(in: 0..<size.width) - 0.5*size.width,
                y: .random(in: 0..<size.height) - 0.5*size.height
            )
            addIndividual(at: position)
        }
    }

    class IndividualEntity : GKEntity {

        var shapeComponent: ShapeComponent {
            guard let shapeComponent = component(ofType: ShapeComponent.self)
                else { fatalError("A IndividualEntity must have a ShapeComponent") }

            return shapeComponent
        }

        var movementComponent: MovementComponent {
            guard let movementComponent = component(ofType: MovementComponent.self)
                else { fatalError("A IndividualEntity must have a MovementComponent") }

            return movementComponent
        }

        override init() {
            super.init()

            addComponent(ShapeComponent())
            addComponent(MovementComponent())
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    var componentSystem = GKComponentSystem(componentClass: MovementComponent.self)
    var individuals = [IndividualEntity]()

    func addIndividual(at pos: CGPoint) {
        let individual = IndividualEntity()
        individual.shapeComponent.node.position = pos
        addChild(individual.shapeComponent.node)
        componentSystem.addComponent(foundIn: individual)

        individuals.append(individual)
    }

    var lastUpdateTimeInterval: TimeInterval = 0
    let maximumUpdateDeltaTime: TimeInterval = 1.0 / 60.0

    override func update(_ currentTime: TimeInterval) {
        guard view != nil else { return }

//        var deltaTime = currentTime - lastUpdateTimeInterval
//        deltaTime = deltaTime > maximumUpdateDeltaTime ? maximumUpdateDeltaTime : deltaTime
//
//        lastUpdateTimeInterval = currentTime

//        componentSystem.update(deltaTime: deltaTime)
    }

}
