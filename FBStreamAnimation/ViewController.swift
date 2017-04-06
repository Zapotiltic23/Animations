//
//  ViewController.swift
//  FBStreamAnimation
//
//  Created by lis meza on 4/2/17.
//  Copyright © 2017 Horacio Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the view that displays our curve
        let curvedView = CurvedView(frame: view.frame)
        curvedView.backgroundColor = .white
        //view.addSubview(curvedView) //We need to add or view
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    func handleTap(){
        
        //This loop calls the function 'generateAnimatedViews()' n times in -> (0...n)
        //This loop animates 2 objects per tap
        (0...1).forEach{ (_) in generateAnimatedViews()
            
        }
}
    fileprivate func generateAnimatedViews(){
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "mewtwo.png") : #imageLiteral(resourceName: "mew.png")
        //Lets add both of our animated icons - Musical Note & World
        let imageView = UIImageView(image: image)
        let dimension = 80 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        //Create the amimation and the assign it a path to follow
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 1 + drand48() * 3
        //This allows the icon to move foward and be removed at the edge of the screen
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
        
    }
}



class CurvedView: UIView{
    
    override func draw(_ rec: CGRect){
        // Do some fancy drawing
            
        let path = customPath()
            
        path.lineWidth = 3
        path.stroke() //Stroking draws the line onto the view
    }


}

func customPath() -> UIBezierPath{
    
    //Create the path that our animation will follow
    let path = UIBezierPath()
    let endPoint = CGPoint(x:450, y:200)
    let randomYshift = 200 + drand48() * 300
    let cp1 = CGPoint(x: 100, y: 100 - randomYshift)
    let cp2 = CGPoint(x: 200, y: 300 + randomYshift)
    
    path.move(to: CGPoint(x:0, y:200))
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    //path.addLine(to: endPoint)
    return path
}










