//
//  ProfileTabView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 13/08/24.
//

import SwiftUI

struct ProfileTabView: View {
    
    @State var isShowActionSheet = false
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: ((selectedImage != nil ? selectedImage : UIImage(named: "profile"))!))
                    .resizable()
                    .frame(width: 150,height: 150)
                    .cornerRadius(75)
                    .overlay {
                        Button(action: {
                            self.isShowActionSheet.toggle()
                        }, label: {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .foregroundStyle(Color.theme.accent)
                                .frame(width: 40,height: 40)
                                .position(x: 125,y: 125)
                        })
                    }
                    .confirmationDialog("Profile Picture", isPresented: $isShowActionSheet) {
                        Button {
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                        } label: {
                            Text("Take Photo")
                        }
                        Button {
                            self.sourceType = .photoLibrary
                            self.isImagePickerDisplay.toggle()
                        } label: {
                            Text("Choose Photo")
                        }
                    } message: {
                        Text("How would you like to select your profile image")
                    }
                List {
                    Section("Personal") {
                        HStack(spacing: 20) {
                            Image(systemName: "person")
                            Text("Ganpat Lal Jangir")
                            Spacer()
                            
                        }
                        HStack(spacing: 20) {
                            Image(systemName: "envelope")
                            Text("ganpatlaljangid7688@gmail.com")
                        }
                        HStack(spacing: 20) {
                            Image(systemName: "calendar")
                            Text("Feb 24, 2002")
                        }
                    }
                    
                    Section("Security") {
                        HStack(spacing: 20) {
                            Image(systemName: "ellipsis.rectangle")
                            Text("Change Password")
                        }
                    }
                    
                    Section("About") {
                        HStack(spacing: 20) {
                            Image(systemName: "lock")
                            Text("Privacy")
                        }
                        HStack(spacing: 20) {
                            Image(systemName: "exclamationmark.circle")
                            Text("Terms and Policies")
                        }
                    }
                    
                    Section("Actions") {
                        HStack(spacing: 20) {
                            Image(systemName: "flag")
                            Text("Report Problem")
                        }
                        Button {
                            AuthenticationDataService().signOut()
                        } label: {
                            HStack(spacing: 20) {
                                Image(systemName: "square.and.arrow.up")
                                    .rotationEffect(.degrees(90))
                                Text("Log Out")
                            }
                        }

                    }
                }
            }
            .navigationTitle("Setting")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "pencil.circle")
                        .foregroundStyle(Color.theme.accent)
                }
            })
            .sheet(isPresented: self.$isImagePickerDisplay, content: {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            })
        }
    }
}

#Preview {
    ProfileTabView()
}
