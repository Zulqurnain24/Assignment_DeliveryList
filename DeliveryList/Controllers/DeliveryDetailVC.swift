//
//  DeliveryDetailVC.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import MapKit

protocol DeliveryDetailVCProtocol {
    func loadView()
    static func getDeliveryDetailVC(delivery: Delivery) -> DeliveryDetailVC
}

/* DeliveryDetailVC
 This is the UIViewcontroller class responsible for displaying the delivery detail to the user
 */
class DeliveryDetailVC: UIViewController {
    var delivery: Delivery!

    override func viewDidLoad() {
         super.viewDidLoad()
    }

}

extension DeliveryDetailVC: DeliveryDetailVCProtocol, MKMapViewDelegate {

    override func loadView() {
        title = "Delivery Detail"
        self.parent?.title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let deliveryDetailView = DeliveryDetailView(frame: UIScreen.main.bounds)
        guard delivery != nil else {
            delivery = Delivery(id: 0, description: "", imageUrl: "placeHolder", location: Location(lat: 0.0, lng: 0.0, address: ""))
            return}
        deliveryDetailView.descriptionLabel.text = "\(delivery.description)"
        
        deliveryDetailView.imageView.imageFromServerURL(urlString: (delivery?.imageUrl) ?? "placeHolder", completionHandler: {
            deliveryDetailView.imageView.image = CommonFunctionality.resizeImage(image: deliveryDetailView.imageView.image ?? UIImage(named: "placeHolder")!, newWidth: 90)
            deliveryDetailView.clipsToBounds = true
            deliveryDetailView.layer.cornerRadius = 10
            deliveryDetailView.contentMode = .scaleAspectFit
            deliveryDetailView.setNeedsDisplay()
        })
        view = deliveryDetailView
        deliveryDetailView.map.delegate = self
        deliveryDetailView.map.addAnnotation(DeliveryCoordinate(name: delivery.description, lat: Double(delivery.location.lat), long: Double(delivery.location.lng)))
        let deliveryLocation = CLLocationCoordinate2D(latitude:  Double(delivery.location.lat), longitude:  Double(delivery.location.lng))
        deliveryDetailView.map.setCenter(deliveryLocation, animated: true)
    }
    
    class func getDeliveryDetailVC(delivery: Delivery) -> DeliveryDetailVC {
        let deliveryDetailVC = DeliveryDetailVC()
        deliveryDetailVC.delivery = delivery
        return deliveryDetailVC
    }
    
}
