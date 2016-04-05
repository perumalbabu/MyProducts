	

import Foundation
import SwiftyJSON
import RxSwift

    
class ServiceManager: NSObject  {
    static let sharedInstance = ServiceManager()
    let postEndpoint: String = "<URL>"
    
    func parseResponse(data : NSData! ) -> [ProductInformation] {
        debugPrint("Starting to Parse")
        let json            = JSON(data: data)
        var productName     = ""
        var color           = ""
        var listPrice:NSDecimalNumber       = 0.0
        var smallImg        = ""
        var largeImg        = ""
        var products:[ProductInformation] = []
        debugPrint("Parsing respponse ..")
        for item in json["results"].arrayValue {
            
            productName     = ""
            color           = ""
            listPrice       = 0.0
            smallImg        = ""
            largeImg        = ""
            
            
            if item["name1"] != nil {
                productName = item["name1"].string!
            }
            debugPrint("Product ..\(productName)")
            
            if item["colorDescription"] != nil {
                color = item["colorDescription"].string!
            }
            debugPrint("Color ..\(color)")
            
            if item["prices"]["list"] != nil {
                listPrice = NSDecimalNumber(string: item["prices"]["list"].string!)
            }
            debugPrint("listPrice ..\(listPrice)")
            
            for img in item["images"].arrayValue {
                
                if img["full"] != nil {
                    largeImg = img["full"].string!
                }
                
                debugPrint("largeImg ..\(largeImg)")
                
                if img["thumb"] != nil {
                    smallImg = img["thumb"].string!
                }
                
                debugPrint("smallImg ..\(smallImg)")
                
            }
            products.append(ProductInformation(productName: productName, productThumbNail: smallImg, productLargeImage: largeImg, price: listPrice, color: color))
            
            
        }
        return  products
    }
    
}
