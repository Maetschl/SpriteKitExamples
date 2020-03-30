//
//  ShapeComponent.swift
//  FpsTest
//
//  Created by Julian Arias Maetschl on 29-03-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import GameplayKit

class ShapeComponent : GKComponent {
//    let node = SKShapeNode(ellipseOf: CGSize(width: 10, height: 10))
    let node = SKSpriteNode(color: .red, size: CGSize(width: 10, height: 10))
    override func didAddToEntity() {
        node.entity = entity
    }

    override func willRemoveFromEntity() {
        node.entity = nil
    }
}
