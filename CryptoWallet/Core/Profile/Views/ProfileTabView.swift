//
//  ProfileTabView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 13/08/24.
//

import SwiftUI

struct ProfileTabView: View {
    
    @State private var isShowProfileActionSheet = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isImagePickerDisplay = false
    
    @StateObject var vm = ProfileTabViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: ((vm.selectedImage == nil ? UIImage(named: "profile") : vm.selectedImage)!))
                    .resizable()
                    .frame(width: 150,height: 150)
                    .cornerRadius(75)
                    .overlay {
                        Button(action: {
                            self.isShowProfileActionSheet.toggle()
                        }, label: {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .foregroundStyle(Color.theme.accent)
                                .frame(width: 40,height: 40)
                                .position(x: 125,y: 125)
                        })
                    }
                    .confirmationDialog("Profile Picture", isPresented: $isShowProfileActionSheet) {
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
                            Text(vm.user?.name ?? "")
                            Spacer()
                            
                        }
                        HStack(spacing: 20) {
                            Image(systemName: "envelope")
                            Text(vm.user?.email ?? "")
                        }
                        HStack(spacing: 20) {
                            Image(systemName: "calendar")
                            Text(vm.user?.dateOfBirth.asShortDateString() ?? "")
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
                            Task{
                                vm.signOut
                            }
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
            .navigationBarBackButtonHidden(true)
            .sheet(isPresented: self.$isImagePickerDisplay, content: {
                ProfileImagePickerView(selectedImage: $vm.selectedImage, sourceType: self.sourceType)
            })
        }
    }
}

#Preview {
    ProfileTabView()
}
