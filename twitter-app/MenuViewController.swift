//
//  MenuViewController.swift
//  twitter-app
//
//  Created by John Franklin on 10/5/15.
//  Copyright © 2015 JF. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    //var homeViewController : TweetsViewController?
    //var mentionsViewController : MentionsViewController?
    var homeViewController : HomeNavigationController?
    var mentionsViewController : MentionsNavigationController?
    
    @IBOutlet weak var mentionsViewControllerButton: UIButton!
    @IBOutlet weak var homeViewControllerButton: UIButton!
    private var activeViewController : UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            // call before removing child view controller's view from hierarchy
            inActiveVC.willMoveToParentViewController(nil)
            
            inActiveVC.view.removeFromSuperview()
            
            // call after removing child view controller's view from hierarchy
            inActiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = contentView.bounds
            contentView.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMoveToParentViewController(self)
        }
    }
    
    @IBOutlet weak var contentView: UIView!
    
    @IBAction func onFirst(sender: AnyObject) {
        print("first button tapped")
        activeViewController = homeViewController
    }
    
    @IBAction func onSecond(sender: AnyObject) {
        print("second button tapped")
        activeViewController = mentionsViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        activeViewController = homeViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}