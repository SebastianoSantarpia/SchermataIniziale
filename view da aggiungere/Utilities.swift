//
//  Utilities.swift
//  CollabRunner
//
//  Created by Marianna D'Amico on 04/06/17.
//  Copyright © 2017 Francesco Magliocca. All rights reserved.
//

import Foundation
import CoreGraphics

// From internet
func getVisibleScreen(sceneWidth: CGFloat, sceneHeight: CGFloat, viewWidth: CGFloat, viewHeight: CGFloat) -> CGRect
{
    var sceneWidth = sceneWidth
    var sceneHeight = sceneHeight
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    let deviceAspectRatio = viewWidth/viewHeight
    let sceneAspectRatio = sceneWidth/sceneHeight
    
    //If the the device's aspect ratio is smaller than the aspect ratio of the preset scene dimensions, then that would mean that the visible width will need to be calculated
    //as the scene's height has been scaled to match the height of the device's screen. To keep the aspect ratio of the scene this will mean that the width of the scene will extend
    //out from what is visible.
    //The opposite will happen in the device's aspect ratio is larger.
    if deviceAspectRatio < sceneAspectRatio {
        let newSceneWidth: CGFloat = (sceneWidth * viewHeight) / sceneHeight
        let sceneWidthDifference: CGFloat = (newSceneWidth - viewWidth)/2
        let diffPercentageWidth: CGFloat = sceneWidthDifference / (newSceneWidth)
        
        //Increase the x-offset by what isn't visible from the lrft of the scene
        x = diffPercentageWidth * sceneWidth
        //Multipled by 2 because the diffPercentageHeight is only accounts for one side(e.g right or left) not both
        sceneWidth = sceneWidth - (diffPercentageWidth * 2 * sceneWidth)
    } else {
        let newSceneHeight: CGFloat = (sceneHeight * viewWidth) / sceneWidth
        let sceneHeightDifference: CGFloat = (newSceneHeight - viewHeight)/2
        let diffPercentageHeight: CGFloat = fabs(sceneHeightDifference / (newSceneHeight))
        
        //Increase the y-offset by what isn't visible from the bottom of the scene
        y = diffPercentageHeight * sceneHeight
        //Multipled by 2 because the diffPercentageHeight is only accounts for one side(e.g top or bottom) not both
        sceneHeight = sceneHeight - (diffPercentageHeight * 2 * sceneHeight)
    }
    
    let visibleScreenOffset = CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(sceneWidth), height: CGFloat(sceneHeight))
    return visibleScreenOffset
}
