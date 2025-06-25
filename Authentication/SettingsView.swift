//
//  SettingsView.swift
//  SwiftulFirebaseBootcamp
//
//  Created by Vinicius on 6/24/25.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    
    func LogOut() throws {
        try AuthenticationManager.shared.singOut()
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List{
            Button("Log Out"){
                Task{
                    do {
                        try viewModel.LogOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }.foregroundColor(.red)
            
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(showSignInView: .constant(false))
}
