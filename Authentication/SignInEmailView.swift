//
//  SignInEmailView.swift
//  SwiftulFirebaseBootcamp
//
//  Created by Vinicius on 6/24/25.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn(){
        guard !email.isEmpty, !password.isEmpty else {
            print("no email or password found.")
            return
        }
        
        Task{
            do{
                let returedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("User signed in successfully: \(returedUserData)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct SignInEmailView: View {
    
@StateObject private var viewModel = SignInEmailViewModel()
    
    var body: some View {
        VStack{
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
          
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                
            Button{
                viewModel.signIn()
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.blue)
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(Text("Sign In With Email"))
    }
}

#Preview {
    SignInEmailView()
}
