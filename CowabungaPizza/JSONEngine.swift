//
//  JSONEngine.swift
//  CowabungaPizza
//
//  Created by Wade Sellers on 12/6/16.
//  Copyright © 2016 WadeSellers. All rights reserved.
//

import UIKit

class JSONEngine: NSObject {

  // There's no need need for multiple JSONEngine objects so I am making this a singleton as a memory management precaution.
  static let sharedInstance = JSONEngine()
  private override init() {}

  func getPizzaToppings() -> [PizzaTopping] {
    var pizzaToppingsArray = [PizzaTopping]()

    if let path = Bundle.main.path(forResource: "PizzaToppings", ofType: "json") {
      if let jsonData = NSData(contentsOfFile: path) {
        do {
          if let jsonResult = try JSONSerialization.jsonObject(with: jsonData as Data, options: [.allowFragments]) as? [AnyObject] {
            for item in jsonResult {
              let toppingDict = item as! Dictionary<String, [String]>
              let toppings = toppingDict["toppings"]
              let pizzaTopping = PizzaTopping.init(withToppingsData: toppings!)
              pizzaToppingsArray.append(pizzaTopping)
            }
          }
        } catch let error as NSError {
          print(error.localizedDescription)
        }
      }
    }
    return pizzaToppingsArray
  }

}
