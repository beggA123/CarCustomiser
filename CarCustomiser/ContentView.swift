//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Begg, Alistair (AMM) on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var motorPackage = false
    @State private var throttlePackage = false
    @State private var isExhaustDisabled = false
    @State private var isTiresDisabled = false
    @State private var isMotorDisabled = false
    @State private var isThrottleDisabled = false
    @State private var money = 10000
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 15
                    money -= 2000
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 15
                    money += 2000
                }
                if money - 1500 < 0 {
                    isTiresDisabled = true
                    isThrottleDisabled = true
                }
                if money - 2000 < 0 {
                    isExhaustDisabled = true
                    isMotorDisabled = true
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    money -= 1500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    money += 1500
                }
                if money - 1500 < 0 {
                    isTiresDisabled = true
                    isThrottleDisabled = true
                }
                if money - 2000 < 0 {
                    isExhaustDisabled = true
                    isMotorDisabled = true
                }
            }
        )
        
        let motorPackageBinding = Binding<Bool> (
            get: { self.motorPackage },
            set: { newValue in
                self.motorPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 1
                    starterCars.cars[selectedCar].acceleration += 1.5
                    money -= 2000
                    if money - 1500 < 0 {
                        isTiresDisabled = true
                        isThrottleDisabled = true
                    }
                    if money - 2000 < 0 {
                        isExhaustDisabled = true
                        isMotorDisabled = true
                    }
                } else {
                    starterCars.cars[selectedCar].handling -= 1
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    money += 2000
                }
            }
        )
        
        let throttlePackageBinding = Binding<Bool> (
            get: { self.throttlePackage },
            set: { newValue in
                self.throttlePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 3.5
                    money -= 1500
                } else {
                    starterCars.cars[selectedCar].acceleration -= 3.5
                    money += 1500
                }
                if money - 1500 < 0 {
                    isTiresDisabled = true
                    isThrottleDisabled = true
                }
                if money - 2000 < 0 {
                    isExhaustDisabled = true
                    isMotorDisabled = true
                }
            }
        )
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text(starterCars.cars[selectedCar].displayStats())
                Button("Next Car", action: {
                    exhaustPackage = false
                    tiresPackage = false
                    motorPackage = false
                    throttlePackage = false
                    if selectedCar >= starterCars.cars.count - 1 {
                        selectedCar = 0
                    } else {
                        selectedCar += 1
                    }
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding).disabled(isExhaustDisabled)
                Toggle("Tires Package", isOn: tiresPackageBinding).disabled(isTiresDisabled)
                Toggle("Motor Package", isOn: motorPackageBinding).disabled(isMotorDisabled)
                Toggle("Throttle Package", isOn: throttlePackageBinding).disabled(isThrottleDisabled)
            }
            Section {
                Text("Money: \(money)")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
