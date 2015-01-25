//
//  ViewController.swift
//  lemonadeStand
//
//  Created by diego prats on 1/24/15.
//  Copyright (c) 2015 diego prats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //top numbers for the budget
    @IBOutlet weak var moneySupplyCount: UILabel!
    @IBOutlet weak var lemonSupplyCount: UILabel!
    @IBOutlet weak var iceSupplyCount: UILabel!
    
    //todays prices
    @IBOutlet weak var lemonPurchaseCount: UILabel!
    @IBOutlet weak var icePurchaseCount: UILabel!
    
    
    //todays counts
    @IBOutlet weak var lemonMixCount: UILabel!
//    @IBOutlet weak var iceMixCount: UILabel!
    
    @IBOutlet weak var iceMixCount2: UILabel!
    
    //instantiating the prices
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    let price = Price()
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    
    var lemonsToMix = 0
    var iceCubesToMix  = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        updateMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //IBActions
    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        
     
        
        
    }
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
    }
    @IBAction func purchaseIceButtonPressed(sender: UIButton) {
    }
    @IBAction func unpurchaseIceButtonPressed(sender: UIButton) {
    }
    
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
    }
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
    }
    @IBAction func mixIceButtonPressed(sender: UIButton) {
    }
    @IBAction func unmixIceButtonPressed(sender: UIButton) {
    }
    
    
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
    }
    
    
        //helper functions
    
    //function to update all the labels
    func updateMainView(){
        
        moneySupplyCount.text = "$\(supplies.money)"
        lemonSupplyCount.text = "$\(supplies.lemons)"
        
        lemonSupplyCount.text = "\(supplies.lemons) lemons"
        iceSupplyCount.text = "\(supplies.iceCubes) ice cubes"
        
        lemonPurchaseCount.text = "\(lemonsToPurchase)"
        icePurchaseCount.text = "\(iceCubesToPurchase)"
        
        lemonMixCount.text = "\(lemonsToMix)"
        iceMixCount2.text = "\(iceCubesToMix)"
        
    }
    
    //function to throw up an alert
    func showAlertWithText(header: String = "Warning", message: String){
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        //action so the user can dismiss the alert
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    

}

