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
    
    func signUp() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("no email or password found.")
            return
        }
        
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
      
    }
    
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("no email or password found.")
            return
        }
        
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
      
    }

}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
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
                Task{
                    do{
                        try await viewModel.signUp()
                        showSignInView = false
                    }catch{
                        print(error)
                    }
                    
                    do{
                        try await viewModel.signIn()
                        showSignInView = false
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Sign In")
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
        .navigationTitle(Text("Sign Up With Email"))
    }
}

#Preview {
    SignInEmailView(showSignInView: .constant(false))
}
