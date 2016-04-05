//
//  ProductInformation.swift
//  MyProducts
//
//  Created by Perumal babu Valiveri veeraperumal on 3/26/16.
//  Copyright © 2016 Perumal babu Valiveri veeraperumal. All rights reserved.
//

import Foundation
import UIKit

enum ServiceException: ErrorType {
    case Empty
    case InvalidRequest
    case CommunicationErrorOnSend
    case CommunicationErrorOnReceive
    case InvalidResponse
}


class ProductInformation :NSObject  {
    private(set) internal var productName:String          = ""
    private(set) internal var productThumbNail :String    = ""
    private(set) internal var productLargeImage :String   = ""
    private(set) internal var price : NSDecimalNumber     = 0.0
    private(set) internal var color : String              = ""
  
    
    init(productName:String ,productThumbNail :String , productLargeImage :String , price : NSDecimalNumber , color : String ) {
        self.productName                = productName
        self.productThumbNail           = productThumbNail
        self.productLargeImage          = productLargeImage
        self.price                      = price
        self.color                      = color
        
    }
    
}