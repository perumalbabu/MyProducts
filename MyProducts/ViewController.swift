//
//  ViewController.swift
//  MyProducts
//
//  Created by Perumal babu Valiveri veeraperumal on 3/11/16.
//  Copyright © 2016 Perumal babu Valiveri veeraperumal. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController , UITableViewDelegate  {

   private var myContext = 0
   var productCell : TblProductCell?
   var viewModel :ProductViewModel = ProductViewModel()
   var disposeBag = DisposeBag()
  
    
   override func viewDidLoad() {
        super.viewDidLoad()
            viewModel.getProducts().subscribeNext({ (myProducts) in
                debugPrint("Obsever notified of the event")
                self.viewModel.ProductInfo = myProducts
                self.productTable.reloadData()
            
            }).addDisposableTo(disposeBag)
    
    }
    
    @IBOutlet weak var productTable: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.ProductInfo.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCellWithIdentifier("TblProductCell") as! TblProductCell
       let productToDisplay = viewModel.ProductInfo[indexPath.row]
        cell.lblPrice.text = productToDisplay.price.stringValue
        cell.lblColor.text = productToDisplay.color
        cell.lblProductName.text = productToDisplay.productName
        cell.load_image(productToDisplay.productThumbNail)
        return cell
    
    }
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        debugPrint("OnRowIndexDeSelected...\(indexPath.row)")
        viewModel.SelectedProductIndex = indexPath.row
        performSegueWithIdentifier("showMoreInfo", sender: self)
        
            }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationController = segue.destinationViewController as! ShowDetailViewController
        destinationController.viewModel.selectedProduct = viewModel.ProductInfo[ viewModel.SelectedProductIndex]
        
    }
   
    private func showAlertMessage(message :String) {
        let objAlertController = UIAlertController(title: "Alert!", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let objOkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { Void in
            return
        })
        objAlertController.addAction(objOkAction)
        presentViewController(objAlertController, animated: true, completion: nil)
    }
    
    deinit {
        
    }
    
        

}

