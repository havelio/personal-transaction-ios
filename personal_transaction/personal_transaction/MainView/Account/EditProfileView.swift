//
//  EditProfileView.swift
//  personal_transaction
//
//  Created by Havelio on 24/03/21.
//

import SwiftUI

struct EditProfileView: View {

    @Environment(\.presentationMode) var presentationMode
    
    @State private var fullname = UserDefaults.standard.fullName
    @State private var githubUrl = UserDefaults.standard.githubUrl
    @State private var linkedinUrl = UserDefaults.standard.linkedinUrl
    
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 25) {
            VStack(alignment: .leading) {
                LabelView("Full Name:", type: .normalSecondary)
                TextFIeldView(text: $fullname)
            }
            VStack(alignment: .leading) {
                LabelView("Github Url:", type: .normalSecondary)
                TextFIeldView(text: $githubUrl)
            }
            VStack(alignment: .leading) {
                LabelView("LinkedIn Url:", type: .normalSecondary)
                TextFIeldView(text: $linkedinUrl)
            }
            Spacer()
        }
        .padding(16)
        .navigationBarTitle("Edit Profile", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(action: {
            presentationMode.wrappedValue.dismiss()
        }), trailing: Button(action: {
            
            if fullname.isEmpty {
                showAlert = true
            } else {
                let db = UserDefaults.standard
                db.fullName = fullname.capitalized
                db.githubUrl = githubUrl
                db.linkedinUrl = linkedinUrl
                presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Text("Save")
                .foregroundColor(.white)
        }))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Please complete your profile"))
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView()
        }
    }
}
