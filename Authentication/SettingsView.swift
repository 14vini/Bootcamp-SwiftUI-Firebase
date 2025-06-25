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
        try AuthenticationManager.shared.signOut()
    }
    
    func ResetPassword() async throws {
        guard let authUser = try? AuthenticationManager.shared.getAuthenticatedUser(),
              let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }

        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "hello123@gmail.com"
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        let password = "hello123"
        try await AuthenticationManager.shared.upadatePassword(password: password)
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List{

            EmailSection
            
            Button("Log Out"){
                Task{
                    do {
                        try viewModel.LogOut()
                        print("PASSWORD RESET.")
                    } catch {
                        print(error)
                    }
                }
            }.foregroundColor(.red)
            
        }
        .navigationTitle("Settings")
    }
}
 
extension SettingsView {
    private var EmailSection: some View {
        Section{
            Button("Reset Password"){
                Task{
                    do {
                        try await viewModel.ResetPassword()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Update Password"){
                Task{
                    do {
                        try await viewModel.updatePassword()
                        print("PASSWORD UPDATED")
                    } catch {
                        print(error)
                    }
                }
            }

            Button("Update Email"){
                Task{
                    do {
                        try await viewModel.updateEmail()
                        print("EMAIL UPDATED")
                    } catch {
                        print(error)
                    }
                }
            }
        } header: {
            Text("Email functions")
        }
    }
}
#Preview {
    SettingsView(showSignInView: .constant(false))
}
