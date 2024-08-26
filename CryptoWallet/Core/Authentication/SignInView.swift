//
//  SignInView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/08/24.
//

import SwiftUI

struct SignInView: View {
    
    @State var userModel: SignInModel = SignInModel(email: "", password: "")
    @StateObject private var authService = AuthenticationDataService()
    @State var showPassword = false
    
    var body: some View {
        if authService.showLoader {
            ProgressView()
                .controlSize(.large)
                .foregroundStyle(Color.theme.accent)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        }else {
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
                
                HStack {
                    if showPassword {
                        TextField("PASSWORD", text: $userModel.password)
                    }else {
                        SecureField("PASSWORD", text: $userModel.password)
                    }
                    Button(action: {
                        showPassword.toggle()
                    }, label: {
                        Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundStyle(Color.theme.accent)
                            .opacity(userModel.password.isEmpty ? 0.0 : 1.0)
                    })
                    .disabled(userModel.password.isEmpty)
                }
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(Color.theme.accent,lineWidth: 2.0)
                }
                
                Button(action: {
                    authService.signInExistingUser(with: userModel)
                }, label: {
                    Text("SIGN IN")
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.7) ,in: RoundedRectangle(cornerRadius: 8.0))
                
                HStack {
                    Text("New User")
                    Button {
                        withAnimation {
                            UserDefaults.standard.set(false, forKey: AppConstants.isShowSignIn)
                        }
                    } label: {
                        Text("Create Account".uppercased())
                            .foregroundColor(.blue)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SignInView()
}


struct SignInModel {
    var email: String
    var password: String
}
