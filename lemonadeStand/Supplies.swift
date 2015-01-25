//
//  Supplies.swift
//  lemonadeStand
//
//  Created by diego prats on 1/24/15.
//  Copyright (c) 2015 diego prats. All rights reserved.
//

import Foundation

struct Supplies {
    
    var money = 0
    var lemons = 0
    var iceCubes = 0
    
    //custom initializer
    init (aMoney: Int, aLemons: Int, aIceCubes: Int){
        money = aMoney
        lemons = aLemons
        iceCubes = aIceCubes
    }
}
