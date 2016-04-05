//
//  ShowDetailViewController.swift
//  MyProducts
//
//  Created by Perumal babu Valiveri veeraperumal on 3/11/16.
//  Copyright © 2016 Perumal babu Valiveri veeraperumal. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {
 private var myContext = 0
    override func viewDidLoad() {
       super.viewDidLoad()
       load_image(viewModel.selectedProduct.productLargeImage)
    }
    
    @IBOutlet weak var largeImage: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal var viewModel:ProductDetailViewModel = ProductDetailViewModel()
   
    internal func load_image(urlString:String)  {
        let imgURL: NSURL = NSURL(string: urlString)!
      
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        NSURLConnection.sendAsynchronousRequest(
            request, queue: NSOperationQueue.mainQueue(),
            completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?) -> Void in
                if error == nil {
                    self.largeImage.image =  UIImage(data: data!)!
                    
                }
        })
        
    }

}
