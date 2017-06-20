//
//  mainScreen.swift
//  view da aggiungere
//
//  Created by Pietro Caruso on 16/06/17.
//  Copyright © 2017 Pietro Caruso. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

let skipCustomization = true

//title screen classes

public class mainScene: baseMenuScene{
    /*
    var mainNode = SKSpriteNode()
    var mainTitle = SKLabelNode()
    */
    var mainStartButton = SpriteButtonChangeScene()
    var mainStartText = SKLabelNode()
    /*
    var emitterStars = SKEmitterNode()
    var downClouds = SKSpriteNode()
    var upClouds = SKSpriteNode()
    var moon = SKSpriteNode()
    var moonHalo = SKSpriteNode()
    var introGame = SKAudioNode()
    */
    override init(size: CGSize) {
        super.init(size: size)
        
        self.name = "title scene"
        
        //initialize objects
        /*
        mainNode = SKSpriteNode(imageNamed: mainScreenBackground)
        
        mainTitle = SKLabelNode(text: mainTitleText)
        */
        
        mainStartText = SKLabelNode(text: mainStartButtonText)
        mainStartButton = SpriteButtonChangeScene(imageNamed: "pergamena.png")
        /*
        emitterStars = SKEmitterNode(fileNamed: "Stars.sks")!
        downClouds = SKSpriteNode(imageNamed: "downCloud.png")
        upClouds = SKSpriteNode(imageNamed: "upCloud.png")
        moon = SKSpriteNode(imageNamed: "moon")
        */
        //setup objects here
        mainStartButton.isUserInteractionEnabled = true
        
        mainStartButton.anchorPoint = anchor
        mainStartButton.selector = #selector(setAssociation(_:))
        /*
        mainNode.anchorPoint = anchor
        
        mainTitle.fontName = mainTitleFont.fontName
        mainTitle.fontSize = mainTitleFont.pointSize
        mainTitle.fontColor = .white
        */
        mainStartText.fontName = mainStartButtonFont.fontName
        mainStartText.fontSize = mainStartButtonFont.pointSize
        mainStartText.fontColor = .black
        
        /*
        emitterStars.particlePositionRange = CGVector(dx: self.size.width, dy: self.size.height )
        emitterStars.zPosition = 2
        
        downClouds.run(SKAction.moveTo(x: 400, duration: 40))
        downClouds.run(SKAction.moveTo(y: 350, duration: 20))
        
        upClouds.run(SKAction.moveTo(x: 400, duration: 70))
        upClouds.run(SKAction.moveTo(y: 350, duration: 20))
        */
        
        
        //set size and origin/position here
        let mainFrame = getVisibleScreen(sceneWidth: self.size.width, sceneHeight: self.frame.height, viewWidth: self.frame.width, viewHeight: self.frame.height)
        
        /*
        mainNode.frame = mainFrame
        mainTitle.position.y = self.frame.height - (mainTitle.fontSize)
        mainTitle.position.x = mainNode.frame.midX
         */
        mainStartButton.size = CGSize(width: mainFrame.size.width / 4, height: mainFrame.size.height / 4)
        
        mainStartButton.position = CGPoint(x: mainFrame.size.width - 1.3 * mainStartButton.size.width , y: 30)
        
        mainStartText.position.y = mainStartButton.size.height / 2
        
        mainStartText.position.x = mainStartButton.size.width / 2
        
        /*
        emitterStars.position = CGPoint.init(x: self.size.width, y: self.size.height / 2)
        downClouds.position = CGPoint(x: self.frame.width - 200, y: 345)
        downClouds.zPosition = 3
        upClouds.position = CGPoint(x: self.frame.width - 200, y: 345)
        upClouds.zPosition = 3
        
        
        moon.position = CGPoint(x: 650, y: 350)
        moon.zPosition = 2
        
        //add objects to the nodes and the scene here
        self.addChild(mainNode)
        mainNode.addChild(mainTitle)
        */
        mainNode.addChild(mainStartButton)
        
        mainStartButton.addChild(mainStartText)
        
        /*
        mainNode.addChild(emitterStars)
        mainNode.addChild(downClouds)
        mainNode.addChild(upClouds)
        mainNode.addChild(moon)
        mainNode.addChild(moonHalo)
        
        introGame.run(SKAction.play())
        mainNode.addChild(introGame)
        */
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc public func setAssociation(_ sender: AnyObject){
        var sc = SKScene()
        
        if skipCustomization{
            sc = passcodeScene.init(size: self.size) as SKScene
        }else{
            sc = customizationScene.init(size: self.size) as SKScene
        }
        mainStartButton.sceneToShow = sc
    }
}

