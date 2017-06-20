//
//  ViewController.swift
//  view da aggiungere
//
//  Created by Pietro Caruso on 09/06/17.
//  Copyright © 2017 Pietro Caruso. All rights reserved.
//


import UIKit
import SpriteKit

//main scene setup


class TitleViewController: UIViewController {

    let anchor = CGPoint.zero
    
    var mainView = SKView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mainView = SKView(frame: self.view.frame)
        
        mainView.presentScene(mainScene(size: self.view.frame.size))
        
        self.view.addSubview(mainView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        fatalError("out of memory")
    }


}


