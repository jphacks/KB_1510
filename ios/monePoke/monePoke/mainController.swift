//
//  ViewController.swift
//  monePoke
//
//  Created by IkegamiYuki on 11/28/15.
//  Copyright © 2015 IkegamiYuki. All rights reserved.
//

import UIKit
import MapKit

class mainController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var plabel: UILabel!
    var myLocation:CLLocationManager!
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/15, UIScreen.mainScreen().bounds.width * 4 / 5, mapView.frame.minY - UIScreen.mainScreen().bounds.height/15)
        
        plabel.center = CGPoint(x: pointLabel.frame.maxX + 25, y: pointLabel.frame.midY + 20)
        
        myLocation = CLLocationManager()
        myLocation.delegate = self
        myLocation.distanceFilter = 1.0
        myLocation.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            self.myLocation.requestAlwaysAuthorization()
        }
        
        myLocation.startUpdatingLocation()
        mapView.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/5, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - tabBar.frame.height - UIScreen.mainScreen().bounds.height/5)
        mapView.delegate = self
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
        
        print("my location is [\(myLat):\(myLon)]")
        
        let myLatDist:CLLocationDistance = 1000
        let myLonDist:CLLocationDistance = 1000
        
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(myConrdinate, myLatDist, myLonDist)
        
        mapView.setRegion(myRegion, animated: true)
        
    }

}

