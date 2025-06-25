//
//  RootView.swift
//  SwiftulFirebaseBootcamp
//
//  Created by Vinicius on 6/24/25.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack{
                AuthView(showSignInView: $showSignInView)
            }
        }
    }
}

#Preview {
    RootView()
}
