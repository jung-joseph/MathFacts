//
//  UserSettingsView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct UserSettingsView: View {
    
    @ObservedObject var userSettings: UserSettings
//    @State private var minNumber: Double
//    @State private var addMaxNumber: Double
    
    var min: Double = -50
    var max: Double = 50
    
    var body: some View {
        
        NavigationView {
            VStack{
//                Text("User Settings").font(.largeTitle).foregroundColor(Color.black)
                Text("Addition Problems").foregroundColor(Color.black)
                HStack{
                    Text("min value").foregroundColor(Color.black)
                    Spacer()
                }
                HStack{
                    Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                    Slider(value: $userSettings.addMinNumber, in: min...max, step: 5 )
                    Text(String(format: "%.0f", max)).foregroundColor(Color.black)

                }
                Text("\(userSettings.addMinNumber)").foregroundColor(Color.black)
//                Spacer()
                HStack{
                    Text("max value").foregroundColor(Color.black)
                    Spacer()
                }
                HStack{
                    Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                    Slider(value: $userSettings.addMaxNumber, in: min...max, step: 5 )
                    Text(String(format: "%.0f", max)).foregroundColor(Color.black)

                }
                Text("\(userSettings.addMaxNumber)").foregroundColor(Color.black)
                Spacer()
            }
        .navigationBarTitle(Text("User Settings"))
        }
    }
}
//#if DEBUG
//struct UserSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserSettingsView(userSettings: UserSettings())
//    }
//}
//#endif
