//
//  AddAsset.swift
//  AssetManager
//
//  Created by Shashi Kiran Kuppili on 8/19/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import SwiftUI







struct AddAsset_User_Model:Identifiable {
    var title: String
    var text: String
    var placeholder: String
    var id:Int
}

struct LabelTextField : View {
    var label: String
    var placeHolder: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(label)
                .font(.headline)
                
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), cornerRadius: 5.0)
        }
        .padding(.horizontal, 15)
    }
}


struct AssetDetails:View {
        @State var category_notifier: String = ""
        @State var asset_id_notifier: String = ""
        @State var selectedIndex: Int = 0
        
      @State var assetArr : [AddAsset_User_Model] = [
           AddAsset_User_Model( title: "Category", text: "", placeholder: "category",id: 0),
           AddAsset_User_Model(title: "Asset ID", text: "", placeholder: "AssetID",id: 1),
           AddAsset_User_Model( title: "Asset code", text: "", placeholder: "AssetCode",id: 2),
           AddAsset_User_Model( title: "Building", text: "", placeholder: "Building",id: 3),
           AddAsset_User_Model( title: "Host name", text: "", placeholder: "HostName",id: 4),
           AddAsset_User_Model( title: "Manufacturer", text: "", placeholder: "Manufacturer",id: 5),
           AddAsset_User_Model(title: "Model No.", text: "", placeholder: "ModelNo",id: 6),
           AddAsset_User_Model( title: "Serial number", text: "", placeholder: "SerialNumber",id: 7),
           AddAsset_User_Model( title: "RAM Size", text: "", placeholder: "RAMSize",id: 8),
           AddAsset_User_Model( title: "RAM Qty.", text: "", placeholder: "RAMQty",id: 9),
           AddAsset_User_Model( title: "HDD Size", text: "", placeholder: "HDDSize",id: 10),
           AddAsset_User_Model( title: "Description details", text: "", placeholder: "DescriptionDetails",id: 11),
           AddAsset_User_Model( title: "Warranty startdate", text: "", placeholder: "WarrantyStartDate",id: 12),
           AddAsset_User_Model( title: "Invoice No.", text: "", placeholder: "InvoiceNo",id: 13)
           
       ]
       
       
       @State var userArr : [AddAsset_User_Model] = [
           AddAsset_User_Model( title: "Emp Name", text: "", placeholder: "Emp Name",id: 0),
           AddAsset_User_Model(title: "Emp no", text: "", placeholder: "Emp no",id: 1),
           AddAsset_User_Model( title: "Allocation Date", text: "", placeholder: "Allocation Date",id: 2),
           AddAsset_User_Model( title: "Floor", text: "", placeholder: "Floor",id: 3),
           AddAsset_User_Model( title: "Location", text: "", placeholder: "Location",id: 4),
           AddAsset_User_Model( title: "Cubicle", text: "", placeholder: "Customer Name",id: 5),
           AddAsset_User_Model( title: "Customer Name", text: "", placeholder: "Customer Name",id: 6),
                  AddAsset_User_Model( title: "Mobile number", text: "", placeholder: "Mobile number",id: 7)
       ]

        var detailsArr: [AddAsset_User_Model] = []
     
        var body: some View{

                VStack {
                    Picker(selection: $selectedIndex, label: Text("")) {
                        Text("Asset Details").tag(0)
                        Text("User Details").tag(1)
                        
                    }.pickerStyle(SegmentedPickerStyle())
                     .padding(.all)
                    
                    if selectedIndex == 0 {
                    AddAsset()
                    }else if selectedIndex == 1 {
                       AddUser()
                    }else {
                        
                    }
                 
                }.padding(.bottom, 5)
                         
            //}
        
    }
}




















struct AddAsset: View {
    
    @State var category_notifier: String = ""
    @State var asset_id_notifier: String = ""
    @State var selectedIndex: Int = 0
    
    @State var assetArr : [AddAsset_User_Model] = [
        AddAsset_User_Model( title: "Category", text: "", placeholder: "category",id: 0),
        AddAsset_User_Model(title: "Asset ID", text: "", placeholder: "AssetID",id: 1),
        AddAsset_User_Model( title: "Asset code", text: "", placeholder: "AssetCode",id: 2),
        AddAsset_User_Model( title: "Building", text: "", placeholder: "Building",id: 3),
        AddAsset_User_Model( title: "Host name", text: "", placeholder: "HostName",id: 4),
        AddAsset_User_Model( title: "Manufacturer", text: "", placeholder: "Manufacturer",id: 5),
        AddAsset_User_Model(title: "Model No.", text: "", placeholder: "ModelNo",id: 6),
        AddAsset_User_Model( title: "Serial number", text: "", placeholder: "SerialNumber",id: 7),
        AddAsset_User_Model( title: "RAM Size", text: "", placeholder: "RAMSize",id: 8),
        AddAsset_User_Model( title: "RAM Qty.", text: "", placeholder: "RAMQty",id: 9),
        AddAsset_User_Model( title: "HDD Size", text: "", placeholder: "HDDSize",id: 10),
        AddAsset_User_Model( title: "Description details", text: "", placeholder: "DescriptionDetails",id: 11),
        AddAsset_User_Model( title: "Warranty startdate", text: "", placeholder: "WarrantyStartDate",id: 12),
        AddAsset_User_Model( title: "Invoice No.", text: "", placeholder: "InvoiceNo",id: 13)
        
    ]
    
    
    @State var userArr : [AddAsset_User_Model] = [
          AddAsset_User_Model( title: "Emp Name", text: "", placeholder: "Emp Name",id: 0),
          AddAsset_User_Model(title: "Emp no", text: "", placeholder: "Emp no",id: 1),
          AddAsset_User_Model( title: "Allocation Date", text: "", placeholder: "Allocation Date",id: 2),
          AddAsset_User_Model( title: "Floor", text: "", placeholder: "Floor",id: 3),
          AddAsset_User_Model( title: "Location", text: "", placeholder: "Location",id: 4),
          AddAsset_User_Model( title: "Cubicle", text: "", placeholder: "Customer Name",id: 5),
          AddAsset_User_Model( title: "Customer Name", text: "", placeholder: "Customer Name",id: 6),
                 AddAsset_User_Model( title: "Mobile number", text: "", placeholder: "Mobile number",id: 7)
          
      ]

    var detailsArr: [AddAsset_User_Model] = []
//    var userDetailsArr: [AddAsset_User_Model]
    
    var body: some View{
        
        //NavigationView {
            
            VStack {
              
                List(assetArr) { asset in
                    HStack(alignment: .center, spacing: 10){
                        Text(asset.title).frame(width: 150, alignment: .leading)
                        TextField("Enter \(asset.placeholder)", text: self.$asset_id_notifier)
                            .textFieldStyle(.roundedBorder)
                        
                    }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    
                }.listRowInsets(EdgeInsets())
                    .navigationBarTitle(Text("Asset Details") , displayMode: .inline)
                    .navigationBarItems(trailing:
                        Button(action: {
                            print("camera tapped!")
                        }) {
                            Image("camera")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .clipped()
                                .scaledToFit()
                    })
                
                Button(action: {
                    print("save tapped!")
                }) {
                    Text("Save")
                        .frame(width: 150, height: 40, alignment: .center)
                }
                    
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(Font.body.bold())
            }.padding(.bottom, 5)
                     
        //}
    }
}






struct AddUser: View {
    
    @State var category_notifier: String = ""
    @State var asset_id_notifier: String = ""
    
    @State var userArr : [AddAsset_User_Model] = [
        AddAsset_User_Model( title: "Emp Name", text: "", placeholder: "Emp Name",id: 0),
        AddAsset_User_Model(title: "Emp no", text: "", placeholder: "Emp no",id: 1),
        AddAsset_User_Model( title: "Allocation Date", text: "", placeholder: "Allocation Date",id: 2),
        AddAsset_User_Model( title: "Floor", text: "", placeholder: "Floor",id: 3),
        AddAsset_User_Model( title: "Location", text: "", placeholder: "Location",id: 4),
        AddAsset_User_Model( title: "Cubicle", text: "", placeholder: "Customer Name",id: 5),
        AddAsset_User_Model( title: "Customer Name", text: "", placeholder: "Customer Name",id: 6),
               AddAsset_User_Model( title: "Mobile number", text: "", placeholder: "Mobile number",id: 7)
        
    ]

    var body: some View{

            VStack {
                List(userArr) { asset in
                    HStack(alignment: .center, spacing: 10){
                        Text(asset.title).frame(width: 150, alignment: .leading)
                        TextField("Enter \(asset.placeholder)", text: self.$asset_id_notifier)
                            .textFieldStyle(.roundedBorder)
                        
                    }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    
                }.listRowInsets(EdgeInsets())
                .navigationBarTitle(Text("User Details") , displayMode: .inline)
                
            Button(action: {
                               print("save tapped!")
                           }) {
                               Text("Save")
                                   .frame(width: 150, height: 40, alignment: .center)
                           }
                               
                           .background(Color.blue)
                           .cornerRadius(10)
                           .foregroundColor(.white)
                           .font(Font.body.bold())
            }.padding(.bottom, 5)
            
          
            
     
    }
}












//#if DEBUG
//struct AddAsset_Previews: PreviewProvider {
//    static var previews: some View {
//        AddAsset()
//    }
//
//
//
//}
//#endif
