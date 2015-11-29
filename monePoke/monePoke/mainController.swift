//
//  ViewController.swift
//  monePoke
//
//  Created by IkegamiYuki on 11/28/15.
//  Copyright © 2015 IkegamiYuki. All rights reserved.
//

import UIKit
import MapKit

var selectPlace:String!
var selectPoint:String!
var selectLocation:Bool!

class mainController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate,UITabBarControllerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var plabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    var myLocation:CLLocationManager!
    var myLati:CLLocationDegrees!
    var myLont:CLLocationDegrees!
    
    let targetPlace1 = [34.694404,135.196027]
    let targetPlace2 = [34.682631,135.186724]
    let targetPlace3 = [34.685716,135.182215]
    let targetPlace4 = [34.679907,135.184402]
    let targetPlace5 = [34.699826,135.190234]
    let targetPlace6 = [34.682121,135.188633]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.475, green: 0.729, blue: 0.910, alpha: 1)

        pointLabel.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/15, UIScreen.mainScreen().bounds.width * 4 / 5, mapView.frame.minY - UIScreen.mainScreen().bounds.height/15)
        pointLabel.font = UIFont(name: "Chalkduster", size: 50)
        
        plabel.center = CGPoint(x: pointLabel.frame.maxX + 25, y: pointLabel.frame.midY + 20)
        plabel.font = UIFont(name: "Chalkduster", size: 17)
        
        userLabel.font = UIFont(name: "Chalkduster", size: 22)
        
        myLocation = CLLocationManager()
        myLocation.delegate = self
        myLocation.distanceFilter = 1.0
        myLocation.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            self.myLocation.requestAlwaysAuthorization()
        }
        
        myLocation.startUpdatingLocation()
        mapView.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/5, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - (self.tabBarController?.tabBar.frame.height)! - UIScreen.mainScreen().bounds.height/5)
        mapView.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        pointLabel.text = "\(userInfo.objectForKey("point")!)"
        userLabel.text = "\(userInfo.objectForKey("name")!)様"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let myLat: CLLocationDegrees = manager.location!.coordinate.latitude
        let myLon: CLLocationDegrees = manager.location!.coordinate.longitude
        let myConrdinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLon) as CLLocationCoordinate2D
        
        myLati = myLat
        myLont = myLon
        
        print("my location is [\(myLat):\(myLon)]")
        
        let myLatDist:CLLocationDistance = 2500
        let myLonDist:CLLocationDistance = 2500
        
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myConrdinate, myLatDist, myLonDist)
        
        mapView.setRegion(myRegion, animated: true)
        
        setPin()
    }
    
    func setPin(){
        let firstPin: MKPointAnnotation = MKPointAnnotation()
        firstPin.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(targetPlace1[0]), CLLocationDegrees(targetPlace1[1]))
        firstPin.title = "ミント神戸"
        firstPin.subtitle = "20pt"
        mapView.addAnnotation(firstPin)
        
        let secondPin: MKPointAnnotation = MKPointAnnotation()
        secondPin.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(targetPlace2[0]), CLLocationDegrees(targetPlace2[1]))
        secondPin.title = "神戸ポートタワー"
        secondPin.subtitle = "10pt"
        mapView.addAnnotation(secondPin)
        
        let thirdPin:MKPointAnnotation = MKPointAnnotation()
        thirdPin.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(targetPlace3[0]), CLLocationDegrees(targetPlace3[1]))
        thirdPin.title = "老祥紀"
        thirdPin.subtitle = "50pt"
        mapView.addAnnotation(thirdPin)

        let forthPin:MKPointAnnotation = MKPointAnnotation()
        forthPin.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(targetPlace4[0]), CLLocationDegrees(targetPlace4[1]))
        forthPin.title = "モザイク"
        forthPin.subtitle = "40pt"
        mapView.addAnnotation(forthPin)
        
        let fifthPin:MKPointAnnotation = MKPointAnnotation()
        fifthPin.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(targetPlace5[0]), CLLocationDegrees(targetPlace5[1]))
        fifthPin.title = "Starbucks 北野異人館店"
        fifthPin.subtitle = "60pt"
        mapView.addAnnotation(fifthPin)
        
        let sixPin:MKPointAnnotation = MKPointAnnotation()
        sixPin.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(targetPlace6[0]), CLLocationDegrees(targetPlace6[1]))
        sixPin.title = "メリケンパーク"
        sixPin.subtitle = "30pt"
        mapView.addAnnotation(sixPin)
    }
    
    func mapView(mapView: MKMapView, didAddAnnotationViews views: [MKAnnotationView]) {
        for view in views {
            view.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
        }
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        selectPlace = view.annotation?.title!
        selectPoint = view.annotation?.subtitle!
        
        let myLoc:CLLocation = CLLocation(latitude: myLati, longitude: myLont)
        let targetLocation: CLLocation = CLLocation(latitude: view.annotation!.coordinate.latitude, longitude: view.annotation!.coordinate.longitude)
        
        if targetLocation.distanceFromLocation(myLoc) < 50.0 {
            selectLocation = true
        }else{
            selectLocation = false
        }
        
        let toLocationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("locationViewController")
        toLocationController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(toLocationController, animated: true, completion: nil)
    }
    
}

