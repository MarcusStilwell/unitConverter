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
                Picker("Choose a unit to convert to", selection: $tempFrom){
                    ForEach (0 ..< tempUnits.count) {
                        Text("\(self.tempUnits[$0])")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
