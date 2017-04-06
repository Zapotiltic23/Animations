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
        
    }//End of viewDidLoad()
    
    func handleTap(){
        
        //This loop calls the function 'generateAnimatedViews()' n times in -> (0...n)
        //This loop animates 2 objects per tap
        (0...1).forEach{ (_) in
            generateAnimatedViews()
            generateAnimatedViews2()
            generateAnimatedViews3()
            
        }//End of forEach()
        
    } //End of handletap()
    
    fileprivate func generateAnimatedViews(){
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "mewtwo.png") : #imageLiteral(resourceName: "mew.png")
        //Lets add both of our animated icons - Musical Note & World
        let imageView = UIImageView(image: image)
        let dimension = 80 + drand48() * 10
        // Size of view Rectangle
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        //Create the amimation and the assign it a path to follow
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().path.cgPath
        animation.duration = 1 + drand48() * 3
        //This allows the icon to move foward and be removed at the edge of the screen
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
        
    } //End of generateAnimatedViews()
    
    
    fileprivate func generateAnimatedViews2(){
        let image2 = drand48() > 0.5 ? #imageLiteral(resourceName: "pokeball.png") : #imageLiteral(resourceName: "masterball.png")
        //Lets add both of our animated icons - Musical Note & World
        let imageView2 = UIImageView(image: image2)
        let dimension2 = 30 + drand48() * 10
        // Size of view Rectangle
        imageView2.frame = CGRect(x: 0, y: 0, width: dimension2, height: dimension2)
        
        //Create the amimation and the assign it a path to follow
        let animation2 = CAKeyframeAnimation(keyPath: "position")
        animation2.path = customPath().path2.cgPath
        animation2.duration = 1 + drand48() * 3
        //This allows the icon to move foward and be removed at the edge of the screen
        animation2.fillMode = kCAFillModeForwards
        animation2.isRemovedOnCompletion = false
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imageView2.layer.add(animation2, forKey: nil)
        view.addSubview(imageView2)
        
    }//End of generateAnimatedViews2()
    
    fileprivate func generateAnimatedViews3(){
        let image3 = drand48() > 0.5 ? #imageLiteral(resourceName: "articuno.png") : #imageLiteral(resourceName: "zapdos.png")
        //Lets add both of our animated icons - Musical Note & World
        let imageView3 = UIImageView(image: image3)
        let dimension3 = 80 + drand48() * 10
        // Size of view Rectangle
        imageView3.frame = CGRect(x: 0, y: 0, width: dimension3, height: dimension3)
        
        //Create the amimation and the assign it a path to follow
        let animation3 = CAKeyframeAnimation(keyPath: "position")
        animation3.path = customPath().path3.cgPath
        animation3.duration = 1 + drand48() * 3
        //This allows the icon to move foward and be removed at the edge of the screen
        animation3.fillMode = kCAFillModeForwards
        animation3.isRemovedOnCompletion = false
        animation3.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imageView3.layer.add(animation3, forKey: nil)
        view.addSubview(imageView3)
        
    }//End of generateAnimatedViews3()
    
}//End of ViewController()


class CurvedView: UIView{
    
    override func draw(_ rec: CGRect){
        // Do some fancy drawing
            
        let path = customPath().path
        path.lineWidth = 3
        path.stroke() //Stroking draws the line onto the view
        
        let path2 = customPath().path2
        path2.lineWidth = 3
        path2.stroke() //Stroking draws the line onto the view
        
        let path3 = customPath().path3
        path3.lineWidth = 3
        path3.stroke() //Stroking draws the line onto the view
        
    } //End of draw()
    
}//End of CurvedView()


func customPath() -> (path: UIBezierPath, path2: UIBezierPath, path3: UIBezierPath){
    
    //------------------------------------------------------------------------------------------------
    //Create first path
    let path = UIBezierPath()
    let endPoint = CGPoint(x:-50, y:100) // Path ends at this point
    //let randomYshift = 200 + drand48() * 300
    let cp1 = CGPoint(x: 100, y: 100 )
    let cp2 = CGPoint(x: 200, y: 300 )
    //let cp1 = CGPoint(x: 100, y: 100 - randomYshift)
    //let cp2 = CGPoint(x: 200, y: 300 + randomYshift)
    
    
    path.move(to: CGPoint(x:400, y:100)) // Path starts at this point
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    
    //------------------------------------------------------------------------------------------------
    
    //------------------------------------------------------------------------------------------------
    //Create second path
    let path2 = UIBezierPath()
    let endPoint2 = CGPoint(x: 450, y: 300) // Path ends at this point
    let cp3 = CGPoint(x: 100, y: 300)
    let cp4 = CGPoint(x: 100, y: 500)
    
    path2.move(to: CGPoint(x: 0, y: 300)) // Path starts at this point
    path2.addCurve(to: endPoint2, controlPoint1: cp3, controlPoint2: cp4)

    //------------------------------------------------------------------------------------------------
    
    //------------------------------------------------------------------------------------------------
    //Create third path
    let path3 = UIBezierPath()
    let endPoint3 = CGPoint(x: -50, y: 500) // Path ends at this point
    let cp5 = CGPoint(x: 100, y: 500)
    let cp6 = CGPoint(x: 100, y: 700)
    
    path3.move(to: CGPoint(x: 400, y: 500)) // Path starts at this point
    path3.addCurve(to: endPoint3, controlPoint1: cp5, controlPoint2: cp6)
    
    //------------------------------------------------------------------------------------------------
    
    return (path, path2, path3)
    
}//End of customPath()










