//
//  WebserviceManager.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import Foundation

protocol WebserviceManagerProtocol {
    func getDeliveriesList(offset: Int, limit: Int, _ completion: @escaping (ResultType<[Delivery]>) -> Void)
}

/* WebserviceManager
 This class houses all the networking logic which is used for downloading the data from API Webservice
 */
class WebserviceManager: NSObject, WebserviceManagerProtocol {
    final let url = URL(string: "\(baseUrl)\(Endpoint.deliveries.rawValue)")
    var deliveriesList = DeliveriesList()

    // Get Deliveries from endpoint of DeliveriesAPI
    func getDeliveriesList(offset: Int, limit: Int, _ completion: @escaping (ResultType<[Delivery]>) -> Void) {
        
        guard let deliveriesListURL = URL(string: "\(baseUrl)\(Endpoint.deliveries.rawValue)/?offset=\(offset)&limit=\(limit)") else { return }
        
        var baseUrlRequest = URLRequest(url: deliveriesListURL)
        baseUrlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        baseUrlRequest.httpMethod = "GET"

        let session = URLSession.shared
        
        session.dataTask(with: baseUrlRequest, completionHandler: { (data, response, error) in
            guard error == nil else {
                completion(ResultType.Failure(e: error!))
                return
            }
            
            guard let data = data else {
                completion(ResultType.Failure(e: error!))
                return
            }
            
            do {
                let jsonFromData =  try JSONDecoder().decode([Delivery].self, from: data)
                completion(ResultType.Success(jsonFromData))
            } catch DecodingError.dataCorrupted(let context) {
                completion(ResultType.Failure(e: DecodingError.dataCorrupted(context)))
            } catch DecodingError.keyNotFound(let key, let context) {
                completion(ResultType.Failure(e: DecodingError.keyNotFound(key, context)))
            } catch DecodingError.typeMismatch(let type, let context) {
                completion(ResultType.Failure(e: DecodingError.typeMismatch(type, context)))
            } catch DecodingError.valueNotFound(let value, let context) {
                completion(ResultType.Failure(e: DecodingError.valueNotFound(value, context)))
            } catch {
                completion(ResultType.Failure(e:JSONDecodingError.unknownError))
            }
            
        }).resume()
    }
}


