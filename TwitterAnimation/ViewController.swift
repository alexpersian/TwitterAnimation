//
//  ViewController.swift
//  TwitterAnimation
//
//  Created by Alexander Persian on 8/12/16.
//  Copyright © 2016 Alexander Persian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    let LogoSizeX: CGFloat = 73.8
    let LogoSizeY: CGFloat = 60.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(colorLiteralRed: 0.16, green: 0.64, blue: 0.93, alpha: 1.0)
        setupMask()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupMask() {
        let mask = CALayer()
        mask.contents = #imageLiteral(resourceName: "twitterlogo").cgImage
        mask.bounds = CGRect(x: 0, y: 0, width: LogoSizeX, height: LogoSizeY)
        mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mask.position = CGPoint(x: view.frame.midX, y: view.frame.midY)

        imageView.layer.mask = mask
        animate(mask: mask)
    }

    func animate(mask: CALayer) {

        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.duration = 2

        keyFrameAnimation.timingFunctions = [
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ]

        let initial = NSValue(cgRect: mask.bounds)
        let shrink = NSValue(cgRect: CGRect(x: 0, y: 0, width: LogoSizeX - 10, height: LogoSizeY - 10))
        let final = NSValue(cgRect: CGRect(x: 0, y: 0, width: 3000, height: 3000))
        keyFrameAnimation.values = [initial, shrink, final]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        mask.add(keyFrameAnimation, forKey: "bounds")

        mask.bounds = CGRect(x: 0, y: 0, width: 3000, height: 3000) // update the model layer to reflect presentation
    }
}

