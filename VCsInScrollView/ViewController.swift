//
//  ViewController.swift
//  VCsInScrollView
//
//  Created by Chaiken, Joshua on 10/15/15.
//  Copyright © 2015 jchaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var controllerIndex = 0
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //makes sure your subviews will take up the full size of the view
        scrollView.autoresizesSubviews = false
        
        //establish your viewcontrollers
        let one = storyboard?.instantiateViewControllerWithIdentifier("Page1") as! PageOneViewController
        let two = storyboard?.instantiateViewControllerWithIdentifier("Page2") as! PageTwoViewController
        let three = storyboard?.instantiateViewControllerWithIdentifier("Page3") as! PageThreeViewController
        //let four = storyboard?.instantiateViewControllerWithIdentifier("Page4") as! PageFourViewController
        
        
        //add them to the array
        let controllerArray : [UIViewController] = [one, two, three]// four]
        
        for controller in controllerArray {
            addViewToScrollView(controller)
        }
        
        //manipulating external viewcontrollers
        //one.btnOne.setTitle("TESTING", forState: .Normal)
        
    }
    
    internal func addViewToScrollView(controller: UIViewController) {
        
        self.addChildViewController(controller)
        self.scrollView.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
        var thisFrame : CGRect = controller.view.frame
        thisFrame.origin.x = CGFloat(controllerIndex)*thisFrame.width
        controller.view.frame = thisFrame
        
        controllerIndex++
        let totalControllers = controllerIndex
        let scrollWidth: CGFloat = CGFloat(totalControllers)*self.view.frame.width
        let scrollHeight: CGFloat = self.view.frame.size.height
        self.scrollView.contentSize = CGSizeMake(scrollWidth, scrollHeight)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

