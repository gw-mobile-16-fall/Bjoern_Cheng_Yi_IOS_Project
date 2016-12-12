//
//  MapViewController.swift
//  party_app
//
//  Created by user122519 on 12/11/16.
//  Copyright © 2016 Bjoern Cheng Yi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    var address : String?
    let geo = CLGeocoder()


    override func viewDidLoad() {
        super.viewDidLoad()
        geo.geocodeAddressString(address!){(placemarks, error) in
            
            // if error end
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "Unable to Forward Geocode Address (\(error)). ", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                return
            }
            
            var location: CLLocation?
            
            // if found location, update location
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }
            
            if let location = location {
                let coordinate = location.coordinate
                let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, 2000, 2000)
                self.map.setRegion(coordinateRegion, animated: false)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                self.map.addAnnotation(annotation)
                
            }else {
                let alert = UIAlertController(title: "Error", message: "No matching location for the address of the party. Please reenter the address", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                return
            }
            // else return
        }
        
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }       
    */

}
