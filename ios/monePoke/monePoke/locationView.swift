//
//  locationView.swift
//  monePoke
//
//  Created by IkegamiYuki on 11/28/15.
//  Copyright © 2015 IkegamiYuki. All rights reserved.
//

import Foundation
import UIKit

class locationView:UIViewController {
    
    @IBOutlet weak var checkInBtn: UIButton!
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var locationPoint: UILabel!
    @IBOutlet weak var placeImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.475, green: 0.729, blue: 0.910, alpha: 1)
        
        checkInBtn.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height*9/10)
        
        locationTitle.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/6, UIScreen.mainScreen().bounds.width, 50)
        locationTitle.font = UIFont.systemFontOfSize(40)
        
        locationPoint.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/6, UIScreen.mainScreen().bounds.width, 120)
        locationPoint.font = UIFont.systemFontOfSize(30)
        
        placeImg.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height/2)
        placeImg.center = view.center
    }
    
    override func viewWillAppear(animated: Bool) {
        
        locationTitle.text = selectPlace
        locationPoint.text = selectPoint
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pushCheckIn(sender: AnyObject) {
        
        var currentPoint = userInfo.objectForKey("point") as! Int
        
        if selectLocation == true {
            let sucAlert = UIAlertController(title: "ポイントを獲得しました！", message: "獲得Point:\(selectPoint)", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
                let pointArray = selectPoint.componentsSeparatedByString("p")
                let plusNum = pointArray[0]
                currentPoint += Int(plusNum)!
                userInfo.setObject(currentPoint, forKey: "point")
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
        }else{
            let sucAlert = UIAlertController(title: "目的地ではありません．", message: "目的地に向かってください．", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action:UIAlertAction!) -> Void in
            })
            sucAlert.addAction(okAction)
            self.presentViewController(sucAlert, animated: true, completion: nil)
            
        }

        }
}