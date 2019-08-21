//
//  ContentView.swift
//  TestGrid
//
//  Created by suram.tejaswini on 19/08/19.
//  Copyright © 2019 suram.tejaswini. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    let buttonCornerRadius:CGFloat = 10

    var image:String
    var title:String
    let frameSizeHeight:CGFloat = 85
    let frameSizeWidth:CGFloat = 120

    var body: some View {
        
        
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .clipped()
                .foregroundColor(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: buttonCornerRadius))
            .padding(buttonCornerRadius)
            .frame(width: frameSizeWidth, height: frameSizeHeight, alignment: .center)
            Text(title) .foregroundColor(Color.black) .font(.subheadline)
        }
        
    }
    
    
}





struct DashboardView: View {
    
    
    let dashBoardArray = ["iphone","machines","print","scan","settings","statics"]
    let buttonCornerRadius:CGFloat = 10
    let frameSize:CGFloat = 100
    
    var body: some View {
        
        //NavigationView {
            
            VStack(alignment: .center, spacing: 20) {
                HStack(alignment: .top, spacing: 25) {
                    
                    NavigationLink(destination: ContentView()) {
                        ButtonView(image: "iphone", title: "iPhone") .overlay(RoundedRectangle(cornerRadius: buttonCornerRadius) .stroke(lineWidth: 1).foregroundColor(Color.black)) .frame(width: frameSize, height: frameSize, alignment: .center)
                    }
                   
                    NavigationLink(destination: ContentView()) {
                        ButtonView(image: "machines", title: "Machines") .overlay(RoundedRectangle(cornerRadius: buttonCornerRadius) .stroke(lineWidth: 1).foregroundColor(Color.black)) .frame(width: frameSize, height: frameSize, alignment: .center)
                    }

                    Button(action: {
                        print("Register tapped!")
                    }) {
                        ButtonView(image: "print", title: "Print") .overlay(RoundedRectangle(cornerRadius: buttonCornerRadius) .stroke(lineWidth: 1).foregroundColor(Color.black)) .frame(width: frameSize, height: frameSize, alignment: .center)
                    }
                } .frame(height: 100)
                
                HStack (alignment: .top, spacing: 25) {
                    Button(action: {
                        print("Register tapped!")
                    }) {
                        ButtonView(image: "scan", title: "Scan") .overlay(RoundedRectangle(cornerRadius: buttonCornerRadius) .stroke(lineWidth: 1).foregroundColor(Color.black)) .frame(width: frameSize, height: frameSize, alignment: .center)
                    }
                    Button(action: {
                        print("Register tapped!")
                    }) {
                        ButtonView(image: "settings", title: "Settings") .overlay(RoundedRectangle(cornerRadius: buttonCornerRadius) .stroke(lineWidth: 1).foregroundColor(Color.black)) .frame(width: frameSize, height: frameSize, alignment: .center)
                    }
                    Button(action: {
                        print("Register tapped!")
                    }) {
                        ButtonView(image: "statics", title: "Statics") .overlay(RoundedRectangle(cornerRadius: buttonCornerRadius) .stroke(lineWidth: 1).foregroundColor(Color.black)) .frame(width: frameSize, height: frameSize, alignment: .center)
                    }
                } .frame(height: 100)
                
                Spacer()
                
                
            } .padding(.top, 20)
            .navigationBarTitle(Text("DashBoard"), displayMode: .inline)
            
            
        //}
    }
}



#if DEBUG
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
