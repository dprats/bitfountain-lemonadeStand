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
    @IBOutlet weak var iceMixCount: UILabel!
    
    //instantiating the prices
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    let price = Price()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //IBActions
    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        
        if supplies.money < price.lemon {
            println("cannot add more lemons without money")
        }
        else {
            supplies.lemons += 1
            supplies.money -= price.lemon
        }
        
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
    
    
    
    

}

