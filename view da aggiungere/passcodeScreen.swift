//
//  passcodeScreen.swift
//  view da aggiungere
//
//  Created by Pietro Caruso on 16/06/17.
//  Copyright © 2017 Pietro Caruso. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

//passcode screen class
public class passcodeScene: baseMenuScene{
    
    var passcodeLocketteSprite = SKSpriteNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        
        passcodeLocketteSprite = SKSpriteNode(imageNamed: passocodeLocketteBackground)
        
        mainTitle.text = passcodeTitleLabelText
        mainTitle.fontName = passcodeTitleLabelFont.fontName
        mainTitle.fontSize = passcodeTitleLabelFont.pointSize
        mainTitle.fontColor = .white
        mainTitle.zPosition = 2
        
        passcodeLocketteSprite.anchorPoint = anchor
        
        passcodeLocketteSprite.size = CGSize(width: self.size.height - 10, height: self.size.height - 10)
        passcodeLocketteSprite.position = CGPoint(x: self.size.width / 2 - passcodeLocketteSprite.size.width / 2, y: self.size.height / 2 - passcodeLocketteSprite.size.height / 2)
        
        passcodeLocketteSprite.zPosition = 0
        
        mainNode.addChild(passcodeLocketteSprite)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//passcode items class
