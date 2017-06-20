//
//  customizationScreen.swift
//  view da aggiungere
//
//  Created by Pietro Caruso on 16/06/17.
//  Copyright © 2017 Pietro Caruso. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

//cutomization screen classes

public class customizationScene: SKScene{
    let anchor = CGPoint.zero
    
    var backgroundNode = SKSpriteNode()
    
    var topBar = SKSpriteNode()
    var bottomBar = SKSpriteNode()
    
    var changeLeft = SpriteButton()
    var changeRight = SpriteButton()
    
    var changeText = SKLabelNode()
    
    //buttons for customizing elements of the theme
    var customizePlayerButton = SpriteButton()
    var customizePlayerText = SKLabelNode()
    
    var customizeBackgroundButton = SpriteButton()
    var customizeBackgroundText = SKLabelNode()
    
    var customizeLevelElementsButton = SpriteButton()
    var customizeLevelElementsText = SKLabelNode()
    
    //the button for the next scene
    var nextButton = SpriteButtonChangeScene()
    var backButton = SpriteButtonChangeScene()
    
    
    var count = 1
    
    //sender is needed to get this functions to work with the selector
    
    //chose theme arrows
    @objc func changeThemeLeft(_ sender: AnyObject){
        print("switched theme lest button")
    }
    
    @objc func changeThemeRight(_ sender: AnyObject){
        print("switched theme right button")
    }
    
    //customize the elements functions
    @objc func customizePlayer(_ sender: AnyObject){
        print("Customize player pressed")
    }
    
    @objc func customizeBackground(_ sender: AnyObject){
        print("customize background presed")
    }
    
    @objc func customizeLevelElements(_ sender: AnyObject){
        print("customize level elemet pressed")
    }
    
    
    override init(size: CGSize) {
        super.init(size: size)
        self.name = "chose scene"
    }
    
    override public func sceneDidLoad() {
        super.sceneDidLoad()
        
        //here initialize elements
        
        backgroundNode = SKSpriteNode(imageNamed: choseScreenBackground)
        
        topBar = SKSpriteNode(color: UIColor.white.withAlphaComponent(0), size: CGSize.zero)
        bottomBar = SKSpriteNode(color: UIColor.white.withAlphaComponent(0), size: CGSize.zero)
        
        changeLeft = SpriteButton(imageNamed: changeLeftBackground)
        changeRight = SpriteButton(imageNamed: changeRightBackground)
        
        changeText = SKLabelNode(text: "theme name here")
        
        customizePlayerButton = SpriteButton(imageNamed: changePlayerBackground)
        customizePlayerText = SKLabelNode(text: changePlayerText)
        
        customizeBackgroundButton = SpriteButton(imageNamed: changeBackgroundBackground)
        customizeBackgroundText = SKLabelNode(text: changeBackgroundText)
        
        customizeLevelElementsButton = SpriteButton(imageNamed: changeLevelElementBackground)
        customizeLevelElementsText = SKLabelNode(text: changeLevelElementText)
        
        nextButton = SpriteButtonChangeScene(color: .white, size: CGSize.zero)
        backButton = SpriteButtonChangeScene(color: .red, size: CGSize.zero)
        
        
        //here setup the objects
        //other items
        backgroundNode.anchorPoint = anchor
        backgroundNode.size = self.size
        
        topBar.anchorPoint = anchor
        bottomBar.anchorPoint = anchor
        
        nextButton.isUserInteractionEnabled = true
        nextButton.anchorPoint = anchor
        nextButton.selector = #selector(setAssociationNext(_:))
        
        backButton.isUserInteractionEnabled = true
        backButton.transtion = .push(with: .right, duration: 0.1)
        backButton.anchorPoint = anchor
        backButton.selector = #selector(setAssociation(_:))
        
        changeLeft.anchorPoint = anchor
        changeLeft.isUserInteractionEnabled = true
        changeLeft.selector = #selector(changeThemeLeft(_:))
        
        changeRight.anchorPoint = anchor
        changeRight.isUserInteractionEnabled = true
        changeRight.selector = #selector(changeThemeRight(_:))
        
        changeText.fontName = changeTextFont.fontName
        changeText.fontSize = changeTextFont.pointSize
        changeText.fontColor = .black
        
        //select players items
        customizePlayerButton.anchorPoint = anchor
        customizePlayerButton.isUserInteractionEnabled = true
        customizePlayerButton.selector = #selector(customizePlayer(_:))
        
        customizePlayerText.fontName = changeItemsLabelFont.fontName
        customizePlayerText.fontSize = changeItemsLabelFont.pointSize
        customizePlayerText.fontColor = changeItemsLabelsColor
        
        
        customizeBackgroundButton.anchorPoint = anchor
        customizeBackgroundButton.isUserInteractionEnabled = true
        customizeBackgroundButton.selector = #selector(customizeBackground(_:))
        
        customizeBackgroundText.fontName = changeItemsLabelFont.fontName
        customizeBackgroundText.fontSize = changeItemsLabelFont.pointSize
        customizeBackgroundText.fontColor = changeItemsLabelsColor
        
        
        customizeLevelElementsButton.anchorPoint = anchor
        customizeLevelElementsButton.isUserInteractionEnabled = true
        customizeLevelElementsButton.selector = #selector(customizeLevelElements(_:))
        
        customizeLevelElementsText.fontName = changeItemsLabelFont.fontName
        customizeLevelElementsText.fontSize = changeItemsLabelFont.pointSize
        customizeLevelElementsText.fontColor = changeItemsLabelsColor
        
        
        setLayout()
        
    }
    
    
    public func setLayout()
    {
        //this function stest the size and position of the elememts
        
        //set size and origin/position of the objects
        let mainFrame = getVisibleScreen(sceneWidth: self.size.width, sceneHeight: self.frame.height, viewWidth: self.frame.width, viewHeight: self.frame.height)
        
        backgroundNode.frame = mainFrame
        
        //the height of teh elemts in the top bar is set from the height of the top bar itself
        topBar.size = CGSize(width: self.frame.width, height: self.frame.height / 6)
        topBar.position = CGPoint(x: 0, y: self.frame.height - topBar.size.height)
        
        bottomBar.size = topBar.size
        bottomBar.position = CGPoint(x: 0, y: 0)//self.frame.height - topBar.size.height)
        
        
        
        //customize elements buttons
        let buttonSide:CGFloat = 150
        
        customizePlayerButton.size = CGSize(width: buttonSide, height: buttonSide)
        
        let space = (self.frame.size.width - (buttonSide * 3)) / 4
        let height = (self.frame.size.height - buttonSide) / 2
        
        customizePlayerButton.position = CGPoint(x: space, y: height)
        
        let labelPosition = CGPoint(x: buttonSide / 2, y: anchor.y)
        
        customizePlayerText.position = labelPosition
        
        customizeBackgroundButton.size = customizePlayerButton.size
        customizeBackgroundButton.position = CGPoint(x: (space * 2) + (buttonSide * 1), y: height)
        
        customizeBackgroundText.position = labelPosition
        
        customizeLevelElementsButton.size = customizePlayerButton.size
        customizeLevelElementsButton.position = CGPoint(x: (space * 3) + (buttonSide * 2), y: height)
        
        customizeLevelElementsText.position = labelPosition
        
        
        nextButton.frame.size = CGSize(width: bottomBar.frame.width / 3, height: bottomBar.frame.height)
        nextButton.position = CGPoint(x: bottomBar.frame.width / 2 - nextButton.frame.width / 2, y: 0)
        backButton.frame.size = nextButton.frame.size
        backButton.position = CGPoint(x: (self.frame.width - (nextButton.size.width * 3)) / 3, y: nextButton.position.y)
        
        
        changeLeft.size = CGSize(width: self.size.width / 16, height: buttonSide + 50)
        changeLeft.position = CGPoint(x: 0, y: height - (changeLeft.size.height - buttonSide) / 2)//self.size.height - changeLeft.size.height)
        
        changeRight.size = changeLeft.size
        changeRight.position = CGPoint(x: self.size.width - changeRight.size.width, y: changeLeft.position.y)//self.size.height - changeLeft.size.height)
        
        changeText.position = CGPoint(x: self.frame.width / 2, y: (topBar.size.height - changeText.fontSize) / 2)
        
        
        //add the objects to the scene
        self.addChild(backgroundNode)
        backgroundNode.addChild(topBar)
        backgroundNode.addChild(bottomBar)
        
        backgroundNode.addChild(changeLeft)
        backgroundNode.addChild(changeRight)
        
        topBar.addChild(changeText)
        
        backgroundNode.addChild(customizePlayerButton)
        backgroundNode.addChild(customizeBackgroundButton)
        backgroundNode.addChild(customizeLevelElementsButton)
        
        customizePlayerButton.addChild(customizePlayerText)
        customizeBackgroundButton.addChild(customizeBackgroundText)
        customizeLevelElementsButton.addChild(customizeLevelElementsText)
        
        bottomBar.addChild(nextButton)
        bottomBar.addChild(backButton)
        
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc public func setAssociation(_ sender: AnyObject){
        var sc = SKScene()
        
        sc = mainScene.init(size: self.size) as SKScene
        backButton.sceneToShow = sc
    }
    
    @objc public func setAssociationNext(_ sender: AnyObject){
        var sc = SKScene()
        sc = passcodeScene.init(size: self.size) as SKScene
        nextButton.sceneToShow = sc
    }
    
    
}
