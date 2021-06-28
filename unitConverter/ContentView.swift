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
    var convertedValue: Double{
        var newTemp = 0.0
        if(tempFrom == 1){
            newTemp = valueFromString+273
        }
        if(tempFrom == 2){
            newTemp = (((valueFromString-32) * (5/9)) + 273.15)
        }
        if(tempTo == 1){
            newTemp += 273
        }
        if(tempTo == 2){
            newTemp = ((newTemp - 273.15) * (9/5) + 32)
        }
        return newTemp
    }
    var body: some View {
        Form{
            Section{
                Picker("Choose a unit to convert to", selection: $tempTo){
                    ForEach (0 ..< tempUnits.count) {
                        Text("\(self.tempUnits[$0])")
                    }
                }
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
