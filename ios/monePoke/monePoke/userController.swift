//
//  userController.swift
//  monePoke
//
//  Created by IkegamiYuki on 11/28/15.
//  Copyright © 2015 IkegamiYuki. All rights reserved.
//

import Foundation
import UIKit

class userController:UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userName: UIImageView!
    @IBOutlet weak var yourPimg: UIImageView!
    @IBOutlet weak var userTextfiled: UITextField!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var changeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.475, green: 0.729, blue: 0.910, alpha: 1)

        userName.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/4)
        userTextfiled.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/4 + 35)
        userTextfiled.placeholder = "vajack"
        userTextfiled.delegate = self
        yourPimg.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/2)
        pointLabel.text = "999999point"
        pointLabel.font = UIFont(name: "Chalkduster", size: 35)
        pointLabel.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/2 + 50)
        pointLabel.layer.cornerRadius = 10
        pointLabel.clipsToBounds = true
        changeBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height*4/5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        userTextfiled.resignFirstResponder()
        
        return true
    }

    @IBAction func changePush(sender: AnyObject) {
        
    }

}