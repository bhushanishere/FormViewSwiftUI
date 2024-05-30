//
//  SettingView.swift
//  FormViewSwiftUI
//
//  Created by Bhushan Borse DXC on 23/04/24.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("deviceName") private var deviceName: String = ""
    @AppStorage("wifi") private var isWifiEnabled: Bool = true
    @AppStorage("autoJoin") private var autoJoinOption: AutoJoinHotspotOption = .never

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $deviceName)
                    LabeledContent("iOS Version", value: "18.0")
                } header: {
                    Text("About")
                }
                
                Section {
                    Toggle("Wi-Fi", isOn: $isWifiEnabled)
                    Picker("Auto-Join Hotspot", selection: $autoJoinOption) {
                        ForEach(AutoJoinHotspotOption.allCases) { option in
                            Text(option.rawValue)
                        }
                    }
                } header: {
                     Text("Internet")
                }
                
                Section {
                    Button("Rest All Content & Settings") {
                        // Reset logic here...
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingView()
}

enum AutoJoinHotspotOption: String, CaseIterable, Identifiable {
    
    var id: Self {
        return self
    }
    
    case never  = "Never"
    case askToJoin = "Ask To Join"
    case automatic  = "Automatic"
}
