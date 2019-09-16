//
//  MulSettingsView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct MulSettingsView: View {
    @ObservedObject var userSettings: UserSettings
    var min: Double
    var max: Double
    var body: some View {
        VStack{
            HStack{
                Text("Multiplication min value").foregroundColor(Color.black)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                Slider(value: $userSettings.mulMinNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.black)
                
            }
            Text("\(userSettings.mulMinNumber)").foregroundColor(Color.black)
            HStack{
                Text("Multipication max value").foregroundColor(Color.black)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                Slider(value: $userSettings.mulMaxNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.black)
                
            }
            Text("\(userSettings.mulMaxNumber)").foregroundColor(Color.black)
            
            
        }
    }
}

struct MulSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MulSettingsView(userSettings: UserSettings(), min: 0, max: 0)
    }
}
