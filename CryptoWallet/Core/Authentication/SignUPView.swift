//
//  SignUPView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/08/24.
//

import SwiftUI

struct SignUPView: View {
    
    @Binding var userModel: SignUPModel
    @State var isShowCalender = false
    
    var body: some View {
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
            
            TextField("PASSWORD", text: $userModel.password)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(Color.theme.accent,lineWidth: 2.0)
                }
            
            Button(action: {}, label: {
                Text("CREATE ACCOUNT")
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green.opacity(0.7) ,in: RoundedRectangle(cornerRadius: 8.0))
            
            HStack {
                Text("Already have account")
                NavigationLink("SIGN IN") {
                    SignInView(userModel: .constant(SignInModel(email: "", password: "")))
                }
                .foregroundColor(.blue)
            }
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    SignUPView(userModel: .constant(SignUPModel(username: "", usermail: "", dateOfBirth: Date(), password: "")))
}


struct SignUPModel {
    var username: String
    var usermail: String
    var dateOfBirth: Date
    var password: String
}
