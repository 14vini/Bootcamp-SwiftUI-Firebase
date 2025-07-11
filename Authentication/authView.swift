//
//  authView.swift
//  SwiftulFirebaseBootcamp
//
//  Created by Vinicius on 6/24/25.
//

import SwiftUI

struct AuthView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    SignInEmailView(showSignInView: $showSignInView)
                    
                } label: {
                    Text("Sign in with Email")
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
            .navigationTitle("Sign In")
        }
    }
}

#Preview {
    AuthView(showSignInView: .constant(false))
}
