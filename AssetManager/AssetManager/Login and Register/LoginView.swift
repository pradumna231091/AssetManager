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
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        UINavigationBar.appearance().backgroundColor = .black
    }
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    
                    //Text("Login") .font(.largeTitle)
                    
                    Spacer()
                    VStack(alignment: .center, spacing: 10) {
                        TextField("Enter Username", text: $username) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle()) //.background(Color.black)
                        TextField("Enter Password", text: $password) .padding(EdgeInsets(top: 0, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)).textFieldStyle(RoundedBorderTextFieldStyle())
                            //.background(Color.black)
                            .padding(.bottom, 50)
                        
                        NavigationLink(destination: DashboardView()) {
                            Text("        Login        ") .foregroundColor(Color.white) .padding(.all, 10) .font(.subheadline) .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(lineWidth: 1).foregroundColor(Color.white))
                        }
                        .padding(.bottom, 15)
                        
                        Text("Don't have an account?") .font(.subheadline) .foregroundColor(.gray)
                        NavigationLink(destination: RegisterView()) {
                            Text("      Register      ") .foregroundColor(Color.white) .padding(.all, 10) .font(.subheadline) .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15) .stroke(lineWidth: 1).foregroundColor(Color.white))
                        }
                        .padding(.bottom, 250)
                        Spacer()
                    }//.background(Color.black)
                }//.background(Color.black)
                    .navigationBarTitle(Text("Login").font(.largeTitle), displayMode: .inline)
                }.colorInvert()
                //.background(Color.black)
        }.colorInvert()
    }
}

