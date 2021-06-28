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
    @State private var tempFromValue = 0.0
    @State private var tempFromValueString = ""
    @State private var newTempValue = 0.0
    var tempUnits = ["Kelvin", "Celsius", "Farenheit"]
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
                Text("\(newTempValue)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
