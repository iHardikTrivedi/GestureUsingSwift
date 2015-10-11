//
//  ViewController.swift
//  GestureRecoginzerUsingSwift
//
//  Created by Hardik Trivedi on 11/10/2015.
//  Copyright (c) 2015 iHartDevelopers. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var vwBox: UIView!
    
    var firstX:Double = 0;
    var firstY:Double = 0;
    
//    MARK: - View Life Cycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.initializeTapGesture()
        self.initializeLongPressedGesture()
        self.initializeRotationGesture()
        self.initializePinchGesture()
        self.initializePanGesture()
    }
    
//    MARK: - Other Methods
    
    func initializeTapGesture()
    {
        var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
            action: Selector("recognizeTapGesture:"))
        vwBox.addGestureRecognizer(tapGesture)
    }
    
    func recognizeTapGesture(sender: UIGestureRecognizer)
    {
        var colorRed: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        var colorGreen: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        var colorBlue: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        vwBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
    }
    
    func initializeLongPressedGesture()
    {
        var longPressedGesture: UILongPressGestureRecognizer =
        UILongPressGestureRecognizer(target: self,
            action: Selector("recognizeLongPressedGesture:"))
        vwBox.addGestureRecognizer(longPressedGesture)
    }
    
    func recognizeLongPressedGesture (sender: UILongPressGestureRecognizer)
    {
        var colorRed: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        var colorGreen: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        var colorBlue: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        vwBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
    }
    
    func initializeRotationGesture()
    {
        var rotateGesture: UIRotationGestureRecognizer =
        UIRotationGestureRecognizer(target: self,
            action: Selector("recognizeRotateGesture:"))
        vwBox.addGestureRecognizer(rotateGesture)
    }
    
    func recognizeRotateGesture(sender: UIRotationGestureRecognizer)
    {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation = 0
    }
    
    func initializePinchGesture()
    {
        var pinchGesture: UIPinchGestureRecognizer =
        UIPinchGestureRecognizer(target: self,
            action: Selector("recognizePinchGesture:"))
        vwBox.addGestureRecognizer(pinchGesture)
    }
    
    func recognizePinchGesture(sender: UIPinchGestureRecognizer)
    {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1
    }
    
    func initializePanGesture()
    {
        var panGesture: UIPanGestureRecognizer =
        UIPanGestureRecognizer(target: self,
            action: Selector("recognizePanGesture:"))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        vwBox.addGestureRecognizer(panGesture)
    }
    
    func recognizePanGesture(sender: UIPanGestureRecognizer)
    {
        var translate = sender.translationInView(self.view)
        sender.view!.center = CGPoint(x:sender.view!.center.x + translate.x,
            y:sender.view!.center.y + translate.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }

}

