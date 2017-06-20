//
//  extensions.swift
//  view da aggiungere
//
//  Created by Pietro Caruso on 16/06/17.
//  Copyright © 2017 Pietro Caruso. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

//extensions to make our life easyer
extension SKSpriteNode{
    override open var frame: CGRect{
        set{
            self.position = newValue.origin
            self.size = newValue.size
        }
        get{
            return CGRect(origin: self.position, size: self.size)
        }
    }
}
