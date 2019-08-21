//
//  RegisterView.swift
//  AssetManager
//
//  Created by Pradumna Patil on 8/20/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import SwiftUI


let leftRightPaddingConstantForTextFields:CGFloat = 30

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    
                    Text("Login") .font(.largeTitle)
                    
                    Spacer()
                    VStack(alignment: .center, spacing: 10) {
                        TextField("Enter Username", text: $username) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Enter Password", text: $password) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            .padding(.bottom, 50)
                        
                        NavigationLink(destination: ContentView()) {
                            Text("        Login        ") .foregroundColor(Color.black) .padding(.all, 10) .font(.subheadline) .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(lineWidth: 1).foregroundColor(Color.black))
                        }
                        .padding(.bottom, 15)
                        
                        Text("Don't have an account?") .font(.subheadline) .foregroundColor(.gray)
                        NavigationLink(destination: RegisterView()) {
                            Text("      Register      ") .foregroundColor(Color.black) .padding(.all, 10) .font(.subheadline) .clipShape(RoundedRectangle(cornerRadius: 15))
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

