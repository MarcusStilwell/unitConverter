//
//  ContentView.swift
//  unitConverter
//
//  Created by Marcus Stilwell on 6/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tempFrom = 0
    @State private var tempTo = 0
    @State private var tempFromValueString = ""
    @State private var newTempValue = 0.0
    var tempUnits = ["Kelvin", "Celsius", "Farenheit"]
    var valueFromString: Double{
        return Double(tempFromValueString) ?? 0.0
    }
    
    //base value will be Kelvin. If the original value is not in Kelvin, the value input by the user will be converted to Kelvin. Then if the unit being converted to is not Kelvin, the value is converted to the new value. Since Kelvin is the base value, there is not a calculation for tempFrom or tempTo if either of those values are Kelvin(0).
    
    var convertedValue: Double{
        var newTemp = valueFromString
        if(tempFrom == 1){
            newTemp += 273
        }
        if(tempFrom == 2){
            newTemp = ((valueFromString - 273.15) * (9/5) + 32)
            
        }
        if(tempTo == 1){
            newTemp += 273
        }
        if(tempTo == 2){
            newTemp = (((valueFromString-32) * (5/9)) + 273.15)
        }
        return newTemp
    }
    var body: some View {
        Form{
            Section{
                Picker("Choose a unit to convert from", selection: $tempTo){
                    ForEach (0 ..< tempUnits.count) {
                        Text("\(self.tempUnits[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section{
                TextField("Enter a the value for \(tempUnits[tempFrom])", text: $tempFromValueString).keyboardType(.decimalPad)
                
            }
            Section{
                Picker("Choose a unit to convert to", selection: $tempFrom){
                    ForEach (0 ..< tempUnits.count) {
                        Text("\(self.tempUnits[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section{
                Text("\(convertedValue, specifier: "%.2f")")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
