//
//  RegisterView.swift
//  AssetManager
//
//  Created by Pradumna Patil on 8/20/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State var emp_no: String = ""
    @State var first_name: String = ""
    @State var last_name: String = ""
    @State var password: String = ""
    @State var confirm_password: String = ""
    @State private var showLogin = false
    
    var body: some View {
        
        
        NavigationView {
            
            if showLogin == true {
                LoginView()
                flipsForRightToLeftLayoutDirection(true)
            }
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    Text("Register") .font(.largeTitle)
                    Spacer()
                    VStack(alignment: .center, spacing: 10) {
                        TextField("Enter Employee No", text: $emp_no) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Enter First Name", text: $first_name) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Enter Last Name", text: $last_name) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Enter Password", text: $password) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Enter Confirm Password", text: $confirm_password) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 50)
                        Button(action: {
                            print("Register tapped!")
                        }) {
                            Text("        Register        ") .foregroundColor(Color.black) .padding(.all, 10) .font(.subheadline) .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(lineWidth: 1).foregroundColor(Color.black))
                        }
                        .padding(.bottom, 250)
                        Spacer()
                    }
                }
            }
        }
    }
}

#if DEBUG
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
#endif
