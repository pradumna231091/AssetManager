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
}

struct StatusView : View {
    var body: some View {
        VStack() {
            Text(" ") .frame(height: 60)
        }
    }
}

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        
        VStack(alignment: .center, spacing: 100) {
            VStack(alignment: .center, spacing: 20) {
            Text("Sign In") .font(.largeTitle) .foregroundColor(Color.white)
            VStack(alignment: .center, spacing: 10) {
                TextField("Username", text: $username) .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)) .textFieldStyle(.roundedBorder)
                TextField("Password", text: $password) .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)) .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    print("Delete tapped!")
                }) {
                    HStack(alignment: .center, spacing: 10) {
                        Text("Login")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15))
                    .foregroundColor(.white)
                    .border(Color.white, width: 2, cornerRadius: 10)
                }
                Spacer(minLength: 50)
                Text("Don't have account?") .font(.subheadline) .foregroundColor(.white)
                                Button(action: {
                    print("Delete tapped!")
                }) {
                    HStack {
                        Text("Register")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .border(Color.white, width: 2, cornerRadius: 10)
                }

            }
            }
        }
         .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)) .background(Color.black) .clipped()
    }
}


//struct ContentView: View {
//
//    @State var name: String = ""
//    @State var listArray:[Asset] = []
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    TextField("Enter something to search...", text: $name) .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)) .textFieldStyle(.roundedBorder)
//                }
//                List {
//                    ForEach(listArray) { model in
//                        AssetCell(model: model, isAllocated: self.randomBool())
//                    }
//                }
//            } .navigationBarTitle(Text("Assets List"), displayMode: .large)
//                .navigationBarItems(trailing:
//                    VStack {
//                        HStack {
//                            Button(action: {
//                                print("Help tapped!")
//                            }) {
//                                Image("filter")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 25, height: 25)
//                                    .clipped()
//                            }
//                            Button(action: {
//                                self.addAssets()
//                            }) {
//                                Image("add")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 25, height: 25)
//                                    .clipped()
//                            }
//                        }
//                })
//        }
//    }
//
//
//    fileprivate func addAssets() {
//        for i in 1...100 {
//            listArray.append(Asset(id: i, assetID: 20949, assetCode: "DES/\(004951+i)", building: "2nd floor GAR Infobahn HYD Corp area", hostName: "EXIHYD-IM-\(057+i)", manufacturer: "Apple", modelNo: "iMac (21.5-inch, 2017)", serialNumber: generateRandomSerialNumber(), rAMSize: "16GB", rAMQty: 2, hDDSize: "1TB", hDDQty: 1, descriptionDetails: "2.3 GHz Intel Core i5", warrantyStartDate: "2018-10-03 0:00:00", invoiceNo: "Invoice No: SEZ1819D1215, PO: 1819/EXL/HYD/IT/0000012"))
//        }
//    }
//
//    fileprivate func randomBool() -> Bool {
//        let randomNo = Int.random(in: 0...1)
//        return randomNo % 2 == 0 ? true : false
//    }
//
//    fileprivate func generateRandomSerialNumber() -> String {
//
//        let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        let len = UInt32(letters.length)
//
//        var randomString = ""
//
//        for _ in 0 ..< 12 {
//            let rand = arc4random_uniform(len)
//            var nextChar = letters.character(at: Int(rand))
//            randomString += NSString(characters: &nextChar, length: 1) as String
//        }
//
//        return randomString
//
//
//    }
//}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif



