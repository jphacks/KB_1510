//
//  pointController.swift
//  monePoke
//
//  Created by IkegamiYuki on 11/28/15.
//  Copyright © 2015 IkegamiYuki. All rights reserved.
//

import Foundation
import UIKit

class pointController:UIViewController {
    @IBOutlet weak var donateBtn: UIButton!
    @IBOutlet weak var limeBtn: UIButton!
    @IBOutlet weak var ommconBtn: UIButton!
    @IBOutlet weak var imunseBtn: UIButton!
    @IBOutlet weak var luku10Btn: UIButton!
    @IBOutlet weak var nanazomBtn: UIButton!
    @IBOutlet weak var palcariBtn: UIButton!
    @IBOutlet weak var hobmoneyBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.475, green: 0.729, blue: 0.910, alpha: 1)

        donateBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width/4, y: UIScreen.mainScreen().bounds.height/5)
        limeBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width/4, y: UIScreen.mainScreen().bounds.height*2/5)
        ommconBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width/4, y: UIScreen.mainScreen().bounds.height*3/5)
        imunseBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width/4, y: UIScreen.mainScreen().bounds.height*4/5)
        luku10Btn.center = CGPoint(x: UIScreen.mainScreen().bounds.width*3/4, y: UIScreen.mainScreen().bounds.height/5)
        nanazomBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width*3/4, y: UIScreen.mainScreen().bounds.height*2/5)
        palcariBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width*3/4, y: UIScreen.mainScreen().bounds.height*3/5)
        hobmoneyBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width*3/4, y: UIScreen.mainScreen().bounds.height*4/5)
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func donatePush(sender: AnyObject) {
        let alart  = UIAlertController(title: "何ポイント利用しますか？", message: "10pt = 1円\n所持ポイント:\(userInfo.objectForKey("point")!)point", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "寄付", style: .Default) { (action:UIAlertAction!) -> Void in
            let textField = alart.textFields![0] as UITextField
            self.usePoint(Int(textField.text!)!)
            let sucAlert = UIAlertController(title: "ポイントを交換しました！", message: "交換ポイント:\(textField.text!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "やめる", style: .Default) { (action:UIAlertAction!) -> Void in
        }
        
        alart.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        alart.addAction(saveAction)
        alart.addAction(cancelAction)
        
        presentViewController(alart, animated: true, completion: nil)
    }
    
    @IBAction func luku10Push(sender: AnyObject) {
        let alart  = UIAlertController(title: "何ポイント利用しますか？", message: "10pt = 1円\n所持ポイント:\(userInfo.objectForKey("point")!)point", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "変換", style: .Default) { (action:UIAlertAction!) -> Void in
            let textField = alart.textFields![0] as UITextField
            self.usePoint(Int(textField.text!)!)
            let sucAlert = UIAlertController(title: "ポイントを交換しました！", message: "交換ポイント:\(textField.text!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "やめる", style: .Default) { (action:UIAlertAction!) -> Void in
        }
        
        alart.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        alart.addAction(saveAction)
        alart.addAction(cancelAction)
        
        presentViewController(alart, animated: true, completion: nil)
    }
    
    @IBAction func limePush(sender: AnyObject) {
        let alart  = UIAlertController(title: "何ポイント利用しますか？", message: "10pt = 1円\n所持ポイント:\(userInfo.objectForKey("point")!)point", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "変換", style: .Default) { (action:UIAlertAction!) -> Void in
            let textField = alart.textFields![0] as UITextField
            self.usePoint(Int(textField.text!)!)
            let sucAlert = UIAlertController(title: "ポイントを交換しました！", message: "交換ポイント:\(textField.text!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "やめる", style: .Default) { (action:UIAlertAction!) -> Void in
        }
        
        alart.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        alart.addAction(saveAction)
        alart.addAction(cancelAction)
        
        presentViewController(alart, animated: true, completion: nil)
    }
    
    @IBAction func nanazomPush(sender: AnyObject) {
        let alart  = UIAlertController(title: "何ポイント利用しますか？", message: "10pt = 1円\n所持ポイント:\(userInfo.objectForKey("point")!)point", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "変換", style: .Default) { (action:UIAlertAction!) -> Void in
            let textField = alart.textFields![0] as UITextField
            self.usePoint(Int(textField.text!)!)
            let sucAlert = UIAlertController(title: "ポイントを交換しました！", message: "交換ポイント:\(textField.text!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "やめる", style: .Default) { (action:UIAlertAction!) -> Void in
        }
        
        alart.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        alart.addAction(saveAction)
        alart.addAction(cancelAction)
        
        presentViewController(alart, animated: true, completion: nil)
    }
    
    @IBAction func ommconPush(sender: AnyObject) {
        let alart  = UIAlertController(title: "何ポイント利用しますか？", message: "10pt = 1円\n所持ポイント:\(userInfo.objectForKey("point")!)point", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "変換", style: .Default) { (action:UIAlertAction!) -> Void in
            let textField = alart.textFields![0] as UITextField
            self.usePoint(Int(textField.text!)!)
            let sucAlert = UIAlertController(title: "ポイントを交換しました！", message: "交換ポイント:\(textField.text!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "やめる", style: .Default) { (action:UIAlertAction!) -> Void in
        }
        
        alart.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        alart.addAction(saveAction)
        alart.addAction(cancelAction)
        
        presentViewController(alart, animated: true, completion: nil)
    }
    
    @IBAction func palcariPush(sender: AnyObject) {
        let alart  = UIAlertController(title: "何ポイント利用しますか？", message: "10pt = 1円\n所持ポイント:\(userInfo.objectForKey("point")!)point", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "変換", style: .Default) { (action:UIAlertAction!) -> Void in
            let textField = alart.textFields![0] as UITextField
            self.usePoint(Int(textField.text!)!)
            let sucAlert = UIAlertController(title: "ポイントを交換しました！", message: "交換ポイント:\(textField.text!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "やめる", style: .Default) { (action:UIAlertAction!) -> Void in
        }
        
        alart.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        alart.addAction(saveAction)
        alart.addAction(cancelAction)
        
        presentViewController(alart, animated: true, completion: nil)
    }
    
    @IBAction func imunsePush(sender: AnyObject) {
        let alart  = UIAlertController(title: "何ポイント利用しますか？", message: "10pt = 1円\n所持ポイント:\(userInfo.objectForKey("point")!)point", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "変換", style: .Default) { (action:UIAlertAction!) -> Void in
            let textField = alart.textFields![0] as UITextField
            self.usePoint(Int(textField.text!)!)
            let sucAlert = UIAlertController(title: "ポイントを交換しました！", message: "交換ポイント:\(textField.text!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "やめる", style: .Default) { (action:UIAlertAction!) -> Void in
        }
        
        alart.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        alart.addAction(saveAction)
        alart.addAction(cancelAction)
        
        presentViewController(alart, animated: true, completion: nil)
    }
    
    @IBAction func hobmoneyPush(sender: AnyObject) {
        let alart  = UIAlertController(title: "何ポイント利用しますか？", message: "10pt = 1円\n所持ポイント:\(userInfo.objectForKey("point")!)point", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "変換", style: .Default) { (action:UIAlertAction!) -> Void in
            let textField = alart.textFields![0] as UITextField
            self.usePoint(Int(textField.text!)!)
            let sucAlert = UIAlertController(title: "ポイントを交換しました！", message: "交換ポイント:\(textField.text!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "やめる", style: .Default) { (action:UIAlertAction!) -> Void in
        }
        
        alart.addTextFieldWithConfigurationHandler { (textField:UITextField!) -> Void in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        alart.addAction(saveAction)
        alart.addAction(cancelAction)
        
        presentViewController(alart, animated: true, completion: nil)
    }
    
    func usePoint(uP:Int){
        var currentPoint = userInfo.objectForKey("point") as! Int
        currentPoint -= uP
        if currentPoint < 0 {
            let sucAlert = UIAlertController(title: "ポイントがたりません．", message: "所持ポイント:\(userInfo.objectForKey("point")!)pt", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }else{
            userInfo.setObject(currentPoint, forKey: "point")   
        }
    }

}