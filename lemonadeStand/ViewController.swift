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
    
    var weatherArray:[[Int]] = [ [-10,-9,-5,-7],[5,8,10,9], [22,25,27,23] ]
    var weatherToday:[Int] = [0,0,0,0]
    
    var weatherImageView:UIImageView = UIImageView(frame: CGRect(x: 20, y: 50, width: 50, height: 50))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(weatherImageView)
        
        updateMainView()
        simulateWeatherToday()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //IBActions
    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        
        if supplies.money > price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You need more money to buy lemons")
        }
     
    
        
    }
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
        
        if lemonsToPurchase > 0 {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You dont have anything to return")
        }
        
        
    }
    @IBAction func purchaseIceButtonPressed(sender: UIButton) {
        
        if supplies.money > price.iceCube {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(header: "Error", message: "You need more money to buy ice")
        }
        
        
    }
    @IBAction func unpurchaseIceButtonPressed(sender: UIButton) {
        
        if iceCubesToPurchase > 0 {
            supplies.money += price.iceCube
            iceCubesToPurchase -= 1
            supplies.iceCubes -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You do not have ice to return")
        }
    }
    
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
        
        if supplies.lemons > 0 {
            //lock our user when they mess with mixture
            lemonsToPurchase = 0
            
            supplies.lemons -= 1
            lemonsToMix += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You do not have enough inventory")
        }
        
    }
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
        
        if lemonsToMix > 0 {
            
            lemonsToPurchase = 0
            lemonsToMix -= 1
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You have no lemons to unmix")
        }
    }
    @IBAction func mixIceButtonPressed(sender: UIButton) {
        
        if supplies.iceCubes > 0 {
            
            iceCubesToPurchase = 0
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You do not have enough ice")
        }
        
    }
    @IBAction func unmixIceButtonPressed(sender: UIButton) {
        
        if iceCubesToMix > 0 {
            
            iceCubesToPurchase = 0
            iceCubesToMix -= 1
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You have no ice to unmix")
            
        }
    }
    
    
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
        
        //generate customers
        //figure out what our ratio is
        //use our customers and preference of our customers and compare against the ratio

        let average = findAverage(weatherToday)
        
        //generate random number 0 through 10
        let customers = Int(arc4random_uniform(UInt32(abs(average))))
        println("customers: \(customers)")
        
        if lemonsToMix == 0 || iceCubesToMix == 0 {
            showAlertWithText(message: "You need to add at least one lemon and once ice cube")
            
        }
        else {
            let lemonadeRatio = Double(lemonsToMix) / Double(iceCubesToMix)
        
        
        //iterate through our customers
            for x in 0...customers {
               
                let preference = Double(arc4random_uniform(UInt32(101)))/100
                if preference < 0.4 && lemonadeRatio > 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference > 0.6 && lemonadeRatio < 1 {
                    supplies.money += 1
                    println("Paid")
                } else if preference <= 0.6 && lemonadeRatio == 1 {
                    supplies.money += 1
                    println("Paid")
                }
            }
            
            //clearing our previous stuff
            
            lemonsToPurchase = 0
            iceCubesToPurchase = 0
            lemonsToMix = 0
            iceCubesToMix = 0
            
            simulateWeatherToday()
            updateMainView()
            
        }
        
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
    func simulateWeatherToday(){
    
        let index = Int(arc4random_uniform(UInt32(weatherArray.count)))
        weatherToday = weatherArray[index]
        
        switch index {
        case 0: weatherImageView.image = UIImage(named: "Cold")
        case 1: weatherImageView.image = UIImage(named: "Mild")
        case 3: weatherImageView.image = UIImage(named: "Warm")
        default: weatherImageView.image = UIImage(named: "Warm")

        }
    
    }
    
    func findAverage(data:[Int]) -> Int {
        var sum = 0
        for x in data {
            sum += x
        }
        var average:Double = Double(sum) / Double(data.count)
        var rounded:Int = Int(ceil(average))
        
        return rounded
    }
    

}

