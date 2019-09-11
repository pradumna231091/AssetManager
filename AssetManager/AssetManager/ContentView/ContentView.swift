//
//  ContentView.swift
//  AssetManager
//
//  Created by Pradumna Patil on 8/13/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import SwiftUI


struct Asset: Identifiable {
    var id: Int
    var assetID:Int
    var assetCode:String
    var building:String
    var hostName:String
    var manufacturer:String
    var modelNo:String
    var serialNumber:String
    var rAMSize:String
    var rAMQty:Int
    var hDDSize:String
    var hDDQty:Int
    var descriptionDetails:String
    var warrantyStartDate:String
    var invoiceNo:String
    
    var allocStatus:Bool
}

struct StatusView : View {
    var body: some View {
        VStack() {
            Text(" ") .frame(height: 60)
        }
    }
}

struct ContentView: View {
    
    @State var name: String = ""
    
    @State var update: Bool = false
    @State var assetModel = AssetModel()
//    var allocStatus: Bool = true
    var body: some View {
        
        VStack {
            HStack {
                TextField("Enter something to search...", text: $name) .padding(EdgeInsets(top: 10, leading: leftRightPaddingConstantForTextFields, bottom: 0, trailing: leftRightPaddingConstantForTextFields)) .textFieldStyle(RoundedBorderTextFieldStyle())
                }.colorInvert()//.background(Color.white)
            List {
                 
                ForEach(assetModel.listArray) { model in
                    
                    HStack(alignment: .center, spacing: 10) {
                        
                        if model.allocStatus == true {
                            StatusView() .background(Color.red)
                        } else {
                            StatusView() .background(Color.green)
                        }
                        NavigationLink(destination: AssetDetails(allocationStatus: model.allocStatus)) {
                            
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(model.modelNo)") .font(.title)
                            HStack(alignment: .center, spacing: 10) {
                                Text("\(model.hostName),") .font(.subheadline) .foregroundColor(Color.gray)
                                Text("\("Serial Number: \(model.serialNumber)")") .font(.subheadline) .foregroundColor(Color.gray)
                            }
                        }
                    } .lineSpacing(5)
                }
                }
            }
            }//.colorInvert()
        .navigationBarTitle(Text("Assets List"), displayMode: .inline)
        .navigationBarItems(trailing:
            VStack {
                HStack {
                    
                    NavigationLink(destination: AddAsset(isNewAsset: true)) {
                        Image("add")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .clipped()
                    }
                    Button(action: {
                        
                    }) {
                        Image("filter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .clipped()
                    }
                }
        })
    }
    
    
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif



