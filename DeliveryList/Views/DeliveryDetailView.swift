//
//  FriendDetailView.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import MapKit

protocol DeliveryDetailViewProtocol {
    func setUpLocationManager()
    func setConstraints()
    func centerMapOnLocation(location: CLLocation)
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation)
}

/* DeliveryDetailView
 This is the UIView which is used to display the delivery detail
 */
class DeliveryDetailView: UIView, CLLocationManagerDelegate, DeliveryDetailViewProtocol  {
    
    internal let distanceSpan: Double = 500
    internal let regionRadius: Double = 500
    internal var locationManager: CLLocationManager? = {
        let locationManager = CLLocationManager()
        return locationManager
    } ()
    
    internal var map: MKMapView = {
        let mapView = MKMapView()
        mapView.backgroundColor = Colors.white
        mapView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 250, height: 100))
        mapView.enableAutoLayout()
        return mapView
    } ()
    
    internal var imageView: UIImageView = {
        var image = UIImage(named: "defaultImage.png")
        var imageView = UIImageView(image: image)
        imageView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 45, height: 45))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Colors.reddish
        imageView.enableAutoLayout()
        return imageView
    } ()
    
    internal var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.backgroundColor = UIColor.white
        label.font = Fonts.subheading
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.enableAutoLayout()
        return label
    } ()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.white
        addSubview(map)
        addSubview(imageView)
        addSubview(descriptionLabel)
        
        setUpLocationManager()
        setConstraints()
    }
    
    func setUpLocationManager() {
        
        locationManager = CLLocationManager()
        
        if let locationManager = locationManager {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.requestAlwaysAuthorization()
            locationManager.distanceFilter = 50
            locationManager.startUpdatingLocation()
        }
    }
    
    func setConstraints() {
        map.topAnchor.constraint(equalTo: (self.topAnchor), constant: 0).activate()
        map.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -Padding.standard).activate()
        map.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 2).activate()
        map.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 2).activate()
        map.widthAnchor.constraint(equalTo: (self.widthAnchor), constant: -(0.1 * ScreenDimensions.width)).activate()
        map.heightAnchor.constraint(equalTo: (self.heightAnchor), constant: -(0.4 * ScreenDimensions.height)).activate()
        
        imageView.topAnchor.constraint(equalTo: map.bottomAnchor, constant: Padding.standard).activate()
        imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: Padding.standard/8).activate()
        imageView.trailingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: -Padding.standard/2).activate()
        
        descriptionLabel.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 0).activate()
        descriptionLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).activate()
        descriptionLabel.sizeThatFits(CGSize(width: 0.65 * self.frame.size.width, height: 0.5 * self.frame.size.height))
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        if let mapView = self.map as MKMapView? {
            let region = MKCoordinateRegion(center: newLocation.coordinate, latitudinalMeters: self.distanceSpan, longitudinalMeters: self.distanceSpan)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
        }
    }
}

