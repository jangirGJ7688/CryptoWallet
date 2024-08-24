//
//  SignInView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/08/24.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var userModel: SignInModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text("BIGBIT")
                .foregroundStyle(Color.theme.accent)
                .font(.largeTitle.bold())
            
            Image("profile")
                .resizable()
                .frame(width: 100,height: 100)
                .cornerRadius(50)
            
            TextField("EMAIL", text: $userModel.email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(Color.theme.accent,lineWidth: 2.0)
                }
            
            TextField("PASSWORD", text: $userModel.password)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(Color.theme.accent,lineWidth: 2.0)
                }
            
            Button(action: {}, label: {
                Text("SIGN IN")
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green.opacity(0.7) ,in: RoundedRectangle(cornerRadius: 8.0))
            
            HStack {
                Text("New User")
                NavigationLink("Create Account".uppercased()) {
                    SignUPView(userModel: .constant(SignUPModel(username: "", usermail: "", dateOfBirth: Date(), password: "")))
                }
                .foregroundColor(.blue)
            }
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    SignInView(userModel: .constant(SignInModel(email: "", password: "")))
}


struct SignInModel {
    var email: String
    var password: String
}
