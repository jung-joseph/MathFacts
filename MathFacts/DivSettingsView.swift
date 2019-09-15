//
//  DivSettingsView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct DivSettingsView: View {
    @ObservedObject var userSettings: UserSettings
    var min: Double
    var max: Double
    var body: some View {
        VStack{
            HStack{
                Text("Division min value").foregroundColor(Color.black)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                Slider(value: $userSettings.divMinNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.black)
                
            }
            Text("\(userSettings.divMinNumber)").foregroundColor(Color.black)
            HStack{
                Text("Division max value").foregroundColor(Color.black)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                Slider(value: $userSettings.divMaxNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.black)
                
            }
            Text("\(userSettings.divMaxNumber)").foregroundColor(Color.black)
            Spacer()
            
            
        }
    }
}

//struct DivSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DivSettingsView()
//    }
//}
