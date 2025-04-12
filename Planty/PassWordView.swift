//
//  PassWordView.swift
//  Planty
//
//  Created by julie ryan on 12/04/2025.
//

import SwiftUI

struct PassWordView: View {
    @State private var password: String = ""
    @State private var showError: Bool = false
    @State private var isAuthenticated: Bool = false
       
       // mot de passe en dure
       private let correctPassword = "Planty2025!"
       
    var body: some View {
            NavigationStack {
                VStack {
                    Text("Entrez le mot de passe")
                    
                    SecureField("Mot de passe", text: $password)
                        .border(Color.gray)
                    
                    Button("Valider") {
                        verifyPassword()
                    }
                    
                    if showError {
                        Text("Mauvais mot de passe")
                          
                    }
                }
                .padding()
                .navigationDestination(isPresented: $isAuthenticated) {
                    MainView()
                }
            }
    }
        
        private func verifyPassword() {
            if password == correctPassword {
                isAuthenticated = true
                showError = false
            } else {
                showError = true
                isAuthenticated = false
            }
    }
}

#Preview {
    PassWordView()
}
