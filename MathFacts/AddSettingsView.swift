//
//  AddSettingsView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct AddSettingsView: View {
    @ObservedObject var userSettings: UserSettings
    var min: Double
    var max: Double

    var body: some View {
        VStack {
            HStack{
                Text("Addition min value").foregroundColor(Color.black)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                Slider(value: $userSettings.addMinNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.black)

            }
            Text("\(userSettings.addMinNumber)").foregroundColor(Color.black)
            HStack{
                Text("Addition max value").foregroundColor(Color.black)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                Slider(value: $userSettings.addMaxNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.black)

            }
            Text("\(userSettings.addMaxNumber)").foregroundColor(Color.black)
        }

    }
}

struct AddSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AddSettingsView(userSettings: UserSettings(), min: 0, max: 0)
    }
}
