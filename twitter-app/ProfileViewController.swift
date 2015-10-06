//
//  ProfileViewController.swift
//  twitter-app
//
//  Created by John Franklin on 10/5/15.
//  Copyright © 2015 JF. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user : User?

    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var tweetsCountLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileBackGroundImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.25, green:0.60, blue:1.00, alpha:1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        if let u = user as User! {
            print("using tweet user")
            profileBackGroundImage.setImageWithURL(NSURL(string : (u.profileBackgroundImageUrl)!))
            profileImage.setImageWithURL(NSURL(string : (u.profileImageUrl)!))
            nameLabel.text = u.name
            screenNameLabel.text = "@" + (u.screenname)!
            tweetsCountLabel.text = String(u.statusCount as Int!)
            followersCountLabel.text = String(u.followersCount as Int!)
            followingCountLabel.text = String(u.followingCount as Int!)
        } else {
            print("using logged in user")
            profileBackGroundImage.setImageWithURL(NSURL(string : (User.currentUser?.profileBackgroundImageUrl)!))
            profileImage.setImageWithURL(NSURL(string : (User.currentUser?.profileImageUrl)!))
            nameLabel.text = User.currentUser?.name
            screenNameLabel.text = "@" + (User.currentUser?.screenname)!
            tweetsCountLabel.text = String(User.currentUser?.statusCount as Int!)
            followersCountLabel.text = String(User.currentUser?.followersCount as Int!)
            followingCountLabel.text = String(User.currentUser?.followingCount as Int!)
        }
        self.view.bringSubviewToFront(profileImage)
        self.view.bringSubviewToFront(nameLabel)
        
    }

    @IBAction func onClose(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
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
