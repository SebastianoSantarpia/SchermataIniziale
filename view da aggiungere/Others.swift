//
//  Others.swift
//  view da aggiungere
//
//  Created by Pietro Caruso on 16/06/17.
//  Copyright © 2017 Pietro Caruso. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

//other usefoul classes
public class SpriteButtonChangeScene: SKSpriteNode {
    public var sceneToShow: SKScene!
    public var transtion: SKTransition = .push(with: .left, duration: 0.2)
    public var selector: Selector!
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if doAction() {
            if presentScene(){
                print("new scene presented")
            }else{
                print("scene not presented")
            }
        }else{
            print("variable initialization function not executed")
        }
    }
    
    private func doAction() -> Bool{
        if let select = selector{
            if let sc = self.scene{
                sc.perform(select, with: self)
                return true
            }else{
                print("the scene is nil, can't perform the sector")
                return false
            }
        }else{
            print("the selector is nil")
            return false
        }
    }
    
    
    private func presentScene() -> Bool{
        let myScene: SKScene = sceneToShow
        let myTransition: SKTransition = transtion
        if scene != nil{
            if let view = self.scene?.view{
                view.presentScene(myScene, transition: myTransition)
                print("Scene changed to: \(myScene)")
                return true
            }else{
                print("The view is nil ")
                return false
            }
        }else{
            print("the new scene is nil")
            return false
        }
    }
}



public class SpriteButton: SKSpriteNode{
    //the selector must be a function that belongs to the scene class of this object
    public var selector: Selector!
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let select = selector{
            if let sc = self.scene{
                sc.perform(select, with: self)
            }else{
                print("the scene is nil, can't perform the sector")
            }
        }else{
            print("the selector is nil")
        }
    }
}
