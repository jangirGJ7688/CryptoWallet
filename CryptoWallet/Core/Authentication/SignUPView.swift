//
//  SignUPView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/08/24.
//

import SwiftUI

struct SignUPView: View {
    
    @State var userModel: SignUPModel = SignUPModel(username: "", usermail: "", dateOfBirth: Date(), password: "")
    @State var isShowCalender = false
    
    @StateObject private var authService = AuthenticationDataService()
    
    var body: some View {
        if authService.showLoader {
            ProgressView()
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
                
                TextField("NAME", text: $userModel.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.theme.accent,lineWidth: 2.0)
                    }
                
                TextField("EMAIL", text: $userModel.usermail)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.theme.accent,lineWidth: 2.0)
                    }
                
                DatePicker("DATE OF BIRTH", selection: $userModel.dateOfBirth, displayedComponents: [.date])
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.theme.accent,lineWidth: 2.0)
                    }
                
                SecureField("PASSWORD", text: $userModel.password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.theme.accent,lineWidth: 2.0)
                    }
                
                Button(action: {
                    authService.createUser(with: userModel)
                }, label: {
                    Text("CREATE ACCOUNT")
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.7) ,in: RoundedRectangle(cornerRadius: 8.0))
                
                HStack {
                    Text("Already have account")
                    Button {
                        withAnimation {
                            UserDefaults.standard.set(true, forKey: AppConstants.isShowSignIn)
                        }
                    } label: {
                        Text("SIGN IN")
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
    SignUPView()
}


struct SignUPModel {
    var username: String
    var usermail: String
    var dateOfBirth: Date
    var password: String
}

