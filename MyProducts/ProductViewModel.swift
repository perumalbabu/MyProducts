//
//  ProductViewModel.swift
//  MyProducts
//
//  Created by Perumal babu Valiveri veeraperumal on 3/26/16.
//  Copyright © 2016 Perumal babu Valiveri veeraperumal. All rights reserved.
//

import Foundation
import UIKit
import RxSwift


class ProductViewModel : NSObject{
    
    // Prop to track the selected item in the view.
    internal var SelectedProductIndex:Int = -1
    
    internal var ProductInfo : [ProductInformation] = []
    
    internal func getProducts() -> Observable<[ProductInformation]> {
        return  self.getProductObservables()
           .observeOn(MainScheduler.instance)
    }
    
    private func getNewworkData() -> Observable<NSData> {
        // TODO: Can read from Info.plist.
        let postEndpoint = "<URL Of the Service.>"
        debugPrint("Starting to getProducts")
        let url = NSURL(string: postEndpoint)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        debugPrint("Creating the request")
        let urlRequest = NSURLRequest(URL: url!)
        return Observable.create { observer in
            let task = session.dataTaskWithRequest(urlRequest) { data, response, error in
                
                if let error = error {
                    debugPrint("Error while getching service data.\(error.description)")
                    observer.onError((error))
                } else {
                    guard let HTTPResponse = response as? NSHTTPURLResponse else {
                        fatalError("No Response received.")
                    }
                    
                    // Using the pattern matchin operator to compare range intervals
                    if 200 ..< 300 ~= HTTPResponse.statusCode {
                        debugPrint("Successful Http Response ")
                        observer.onNext(data ?? NSData())
                        // Closing the observer . No further events to be sent.
                        observer.onCompleted()
                        
                    }
                    else {
                        debugPrint("Unexpected expected Response code")
                        observer.onError(ServiceException.InvalidRequest)
                    }
                }
            }
            task.resume()
            return AnonymousDisposable {
                task.cancel()
            }
        }
    }
    
    // Return an observable of PrductInformation Array.
    func getProductObservables() -> Observable<[ProductInformation]> {
        // Get an obserbable of NSData containg the Service Response and map the obserbales to a function that parses 
        // Network Data and returns an observable of ProductInformation Array.
        return getNewworkData().map { data in
            guard let objects: [ProductInformation] = ServiceManager.sharedInstance.parseResponse(data) else {
                throw ServiceException.InvalidResponse
                
            }
            return objects
        }
    }

}

class ProductDetailViewModel : NSObject{
    internal dynamic var selectedProduct =  ProductInformation (productName: "", productThumbNail: "", productLargeImage: "", price: 0, color: "")
    
}


