import SpriteKit

let height: CGFloat = 20.0
let width: CGFloat = 150.0

let shapeNode: SKShapeNode = SKShapeNode(rectOf: CGSize(width: width, height: height))
shapeNode.isAntialiased = false
shapeNode.lineWidth = 0
print(shapeNode.frame.size.width, shapeNode.frame.size.height)
