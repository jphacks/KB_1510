//
//  loginController.swift
//  monePoke
//
//  Created by IkegamiYuki on 11/28/15.
//  Copyright © 2015 IkegamiYuki. All rights reserved.
//

import Foundation
import UIKit

let userInfo:NSUserDefaults = NSUserDefaults.standardUserDefaults()

class loginController:UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var joinBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.475, green: 0.729, blue: 0.910, alpha: 1)
        
        nameImg.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/3 - 35)
        userName.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/3)
        userName.delegate = self
        joinBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height * 4 / 5)
    }
    
    override func viewDidAppear(animated: Bool) {
        //UUID
        let uuidObj:CFUUIDRef = CFUUIDCreate(nil)
        let uuidString:NSString = CFUUIDCreateString(nil, uuidObj)
        
        let uid:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var devices:NSString
        if (uid.objectForKey("uuid") != nil) {
            print("true")
            devices = uid.objectForKey("uuid")! as! NSString
            let toMainController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabBarController")
            toMainController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            self.presentViewController(toMainController, animated: false, completion: nil)
        }else{
            print("false")
            devices = uuidString
            uid.setObject(devices, forKey: "uuid")
            uid.synchronize()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    @IBAction func joinPush(sender: AnyObject) {
        userInfo.setObject(userName.text, forKey: "name")
        userInfo.setObject(0, forKey: "point")
    }
}