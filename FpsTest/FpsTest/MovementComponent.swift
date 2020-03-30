//
//  MovementComponent.swift
//  FpsTest
//
//  Created by Julian Arias Maetschl on 29-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import GameplayKit

class MovementComponent : GKComponent {
    var speed : CGFloat = 25
    var direction : CGFloat = .random(in: 0...(2 * .pi)) {
        didSet { updateSinCos() }
    }
    var sinDir : CGFloat = 0
    var cosDir : CGFloat = 0

    override init() {
        super.init()
        updateSinCos()
    }

    override func didAddToEntity() {
        entity?.component(ofType: ShapeComponent.self)?.node.physicsBody = SKPhysicsBody(circleOfRadius: 5.0)
        entity?.component(ofType: ShapeComponent.self)?.node.physicsBody?.isDynamic = true
        entity?.component(ofType: ShapeComponent.self)?.node.physicsBody?.affectedByGravity = false
        entity?.component(ofType: ShapeComponent.self)?.node.physicsBody?.velocity = CGVector(dx: 100*sinDir, dy: 10*cosDir)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var shapeComponent: ShapeComponent {
        guard let shapeComponent = entity?.component(ofType: ShapeComponent.self)
            else { fatalError("A MovementComponent's entity must have a ShapeComponent") }

        return shapeComponent
    }

    func updateSinCos() {
        sinDir = sin(direction)
        cosDir = cos(direction)
    }
}
