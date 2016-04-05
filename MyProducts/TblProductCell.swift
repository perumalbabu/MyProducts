//
//  TblProductCell.swift
//  MyProducts
//
//  Created by Perumal babu Valiveri veeraperumal on 3/11/16.
//  Copyright © 2016 Perumal babu Valiveri veeraperumal. All rights reserved.
//

import UIKit


@IBDesignable class TblProductCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
   
    
    internal func load_image(urlString:String)  {
        let imgURL: NSURL = NSURL(string: urlString)!
      
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        NSURLConnection.sendAsynchronousRequest(
            request, queue: NSOperationQueue.mainQueue(),
            completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?) -> Void in
                if error == nil {
                    self.imgProduct.image =  UIImage(data: data!)!
                    
                }
        })
        
    }
   override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
