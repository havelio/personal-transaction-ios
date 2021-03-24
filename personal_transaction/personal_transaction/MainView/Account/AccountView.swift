//
//  Account.swift
//  SwiftUI Demo
//
//  Created by Havelio on 23/03/21.
//

import SwiftUI
import StoreKit

struct AccountView: View {
    
    @AppStorage(UserDefaultsKeys.userName.rawValue) var fullname: String = UserDefaults.standard.fullName
    
    @State var showClearDataAlert = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                VStack(spacing: 10) {
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 100, height: 100)
                            .cornerBorder(radius: 50, lineWidth: 2)
                        Image(systemName: "camera")
                            .foregroundColor(Color.primary.opacity(0.5))
                    }
                    
                    LabelView(fullname, type: .veryLarge)
                    LabelView("Version: \(MainDevice.versionNumber)", type: .normalSecondary)
                    Divider()
                        .padding(.top, 16)
                }
                
                VStack(spacing: 15) {
                    NavigationLink(
                        destination: EditProfileView(),
                        label: {
                            HStack(spacing: 7) {
                                Image(systemName: "person")
                                LabelView("Edit Profile")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        })
                        .accentColor(.primary)
                    Divider()

                    Button(action: {
                        open(url: UserDefaults.standard.githubUrl)
                    }, label: {
                        HStack(spacing: 7) {
                            Image(systemName: "phone")
                            LabelView("Contact Me")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    })
                    .accentColor(.primary)
                    Divider()

                    Button(action: {
                        if let scene = UIApplication.shared.windows.first?.windowScene { SKStoreReviewController.requestReview(in: scene)
                        }
                    }, label: {
                        HStack(spacing: 7) {
                            Image(systemName: "star")
                            LabelView("Rate This App")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    })
                    .accentColor(.primary)

                    Divider()
                
                    Button(action: {
                        showClearDataAlert = true
                    }, label: {
                        HStack(spacing: 7) {
                            Image(systemName: "trash")
                            LabelView("Clear Data")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    })
                    .accentColor(.primary)
                }
            }
            .padding(20)
        }
        .navigationBarTitle("Account", displayMode: .inline)
        .alert(isPresented: $showClearDataAlert) {
            Alert(
                title: Text("Clear Data?"),
                message: Text("Are you sure to delete all your data"),
                primaryButton: .destructive(Text("Yes Clear Data"), action: { resetDefaults() }),
                secondaryButton: .cancel()
            )
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountView()
        }
    }
}
