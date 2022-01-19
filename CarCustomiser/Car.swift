//
//  Car.swift
//  CarCustomiser
//
//  Created by Begg, Alistair (AMM) on 17/01/2022.
//

import Foundation

struct Car {
    
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
                Make: \(self.make)
                Model: \(self.model)
                Top Speed: \(self.topSpeed)mph
                Acceleration (0-60): \(self.acceleration)s
                Handling: \(self.handling)
                """
    }
}
