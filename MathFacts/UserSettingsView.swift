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
    
    var body: some View {
        VStack{
            Text("User Settings").font(.largeTitle).foregroundColor(Color.black)
            HStack{
                Text("Addition Problems").foregroundColor(Color.black)
                Spacer()
            }
            Spacer()
        }
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView(userSettings: UserSettings())
    }
}
