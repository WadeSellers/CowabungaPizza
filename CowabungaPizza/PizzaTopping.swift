//
//  PizzaTopping.swift
//  CowabungaPizza
//
//  Created by Wade Sellers on 12/6/16.
//  Copyright © 2016 WadeSellers. All rights reserved.
//

import UIKit

class PizzaTopping: NSObject {

  var toppings: [String]

  init(withToppingsData toppings: [String]) {
    self.toppings = toppings
    super.init()
  }

}
