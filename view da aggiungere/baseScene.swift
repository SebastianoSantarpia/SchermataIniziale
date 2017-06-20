//
//  baseScene.swift
//  view da aggiungere
//
//  Created by Pietro Caruso on 16/06/17.
//  Copyright © 2017 Design and Animation by Santarpia Sebastiano. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

public class baseMenuScene: SKScene{
    let anchor = CGPoint.zero
    
    var mainNode = SKSpriteNode()
    var mainTitle = SKLabelNode()
    
    var emitterStars = SKEmitterNode()
    var downClouds = SKSpriteNode()
    var upClouds = SKSpriteNode()
    var moon = SKSpriteNode()
    var introGame = SKAudioNode()
    var sunrise = SKSpriteNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = .white
        
        self.name = "title scene"
        
        //initialize objects
        mainNode = SKSpriteNode(imageNamed: mainScreenBackground)
        
        mainTitle = SKLabelNode(text: mainTitleText)
        
        emitterStars = SKEmitterNode(fileNamed: "Stars.sks")!
        downClouds = SKSpriteNode(imageNamed: "downCloud.png")
        upClouds = SKSpriteNode(imageNamed: "upCloud.png")
        moon = SKSpriteNode(imageNamed: "moon")
        sunrise = SKSpriteNode(imageNamed: "Sunrise")
        //setup objects here
        
        mainNode.anchorPoint = anchor
        
        mainTitle.fontName = mainTitleFont.fontName
        mainTitle.fontSize = mainTitleFont.pointSize
        mainTitle.fontColor = UIColor.white.withAlphaComponent(0)
        
        
        
        
        //set size and origin/position here
        let mainFrame = getVisibleScreen(sceneWidth: self.size.width, sceneHeight: self.frame.height, viewWidth: self.frame.width, viewHeight: self.frame.height)
        
        
        mainNode.frame = mainFrame
        mainNode.zPosition = 1
        
        mainTitle.position.y = self.frame.height - (mainTitle.fontSize)
        
        mainTitle.position.x = mainNode.frame.midX
        
        emitterStars.particlePositionRange = CGVector(dx: self.size.width - 200 , dy: self.size.height - 200 )
        emitterStars.position = CGPoint.init(x: self.size.width, y: self.size.height / 2)
        emitterStars.zPosition = 2
        
        downClouds.position = CGPoint(x: self.frame.width - 160, y: 250)
        downClouds.zPosition = 3
        
        upClouds.position = CGPoint(x: self.frame.width - 140, y: 290)
        upClouds.zPosition = 3
        
        moon.position = CGPoint(x: 570, y: 280)
        moon.size = CGSize(width: 140, height: 150)
        moon.zPosition = 2
        
        sunrise.position = CGPoint(x: frame.size.width/2 , y: frame.size.height/2)
        sunrise.zPosition = 0
        
        //Handle Animations(For Pedro)
        
        downClouds.run(SKAction.moveTo(x: self.frame.width - 300, duration: 100))
        downClouds.run(SKAction.moveTo(y: 250, duration: 20))
        
        upClouds.run(SKAction.moveTo(x: self.frame.width + 20, duration: 80))
        upClouds.run(SKAction.moveTo(y: 290, duration: 20))
        
        sunrise.run(SKAction.moveTo(x: frame.size.width/2 , duration:10))
        sunrise.run(SKAction.moveTo(y: frame.size.height/2 + 80, duration: 5))
        
        
        //add objects to the nodes and the scene here
        self.addChild(sunrise)
        
        self.addChild(mainNode)
        mainNode.addChild(mainTitle)
        
        mainNode.addChild(emitterStars)
        mainNode.addChild(downClouds)
        mainNode.addChild(upClouds)
        mainNode.addChild(moon)
        
        
        introGame.run(SKAction.play())
        mainNode.addChild(introGame)
      
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
}




