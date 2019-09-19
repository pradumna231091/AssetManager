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
     @State var notifier :String = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Text(label).frame(width: 150, alignment: .leading)
            TextField(placeHolder, text: self.$notifier)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            .colorInvert()
        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        
        //.padding(.horizontal, 15)
    }
}


struct AssetDetails:View {
    
        @State var category_notifier: String = ""
        @State var asset_id_notifier: String = ""
        @State var selectedIndex: Int = 0
        @State var allocationStatus:Bool
        var body: some View{
            
                VStack {
                    if allocationStatus == true{
                                   Picker(selection: $selectedIndex, label: Text("")) {
                                       Text("Asset Details").tag(0)
                                       Text("User Details").tag(1)
                                       
                                   }.pickerStyle(SegmentedPickerStyle())
                                    .padding(.all)
                                   if selectedIndex == 0 {
                                    AddAsset(isNewAsset: false)
                                   }else if selectedIndex == 1 {
                                      AddUser(allocStatus: allocationStatus)
                                    
                        }
                        Button(action: {
                            print("Deallocate tapped!")
                        }) {
                            Text("Deallocate")
                                .frame(width: 150, height: 40, alignment: .center)
                        }.background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(Font.body.bold())
                        
                        }else{
                        
                        AddAsset(isNewAsset: false)
                        NavigationLink(destination:AddUser(allocStatus: allocationStatus)){
                        Text("Assign")
                            .frame(width: 150, height: 40, alignment: .center)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(Font.body.bold())
                        }
                    }
                    
                    }.padding(.bottom, 5).background(Color.black).colorInvert()
               
    }
}

struct AddAsset: View {

    @State var showImagePicker: Bool = false
    @State var isCamera: Bool = false
    @State var image: Image? = nil
    
    @State var showActionSheet: Bool = false
    
    @State var category_notifier: String = ""
    @State var asset_ID_notifier: String = ""
    @State var asset_Code_notifier: String = ""
    @State var building_notifier: String = ""
    @State var host_Name_notifier: String = ""
    @State var manufacturer_notifier: String = ""
    @State var model_No_notifier: String = ""
    @State var serial_No_notifier: String = ""
    @State var rAM_Size_notifier: String = ""
    @State var rAM_Qty_notifier: String = ""
    @State var hDD_Size_notifier: String = ""
    @State var description_notifier: String = ""
    @State var warranty_notifier: String = ""
    @State var invoice_No_notifier: String = ""
    @State var isNewAsset:Bool 
     @State private var showingAlert:Bool = false
    
    var actionSheet: ActionSheet {
      ActionSheet(title: Text("Choose a photo"), message: Text("Please choose a photo"), buttons: [
            .default(Text("Camera"), action: {
                withAnimation {
                    self.isCamera = true
                self.showImagePicker.toggle()
                 
                }
            }),
            .default(Text("Gallery"), action: {
                withAnimation {
                    self.showImagePicker.toggle()
//                    updateUIViewController
                }
            }),
            .destructive(Text("Cancel"))
        ])
    }
   
    var body: some View{
            
            VStack {
                List{
               
                LabelTextField(label: "Category", placeHolder: "Enter Category", notifier:self.category_notifier)
                LabelTextField(label: "Asset ID", placeHolder: "Enter Asset ID", notifier:self.asset_ID_notifier)
                LabelTextField(label: "Asset Code", placeHolder: "Enter Asset Code", notifier:self.asset_Code_notifier)
                LabelTextField(label: "Building", placeHolder: "Enter Building No.", notifier:self.building_notifier)
                LabelTextField(label: "Host name", placeHolder: "Enter Host name", notifier:self.host_Name_notifier)
                LabelTextField(label: "Manufacturer", placeHolder: "Enter Manufacturer", notifier:self.manufacturer_notifier)
                LabelTextField(label: "Model No.", placeHolder: "Enter Model No.", notifier:self.model_No_notifier)
                LabelTextField(label: "Serial number", placeHolder: "Enter Serial number", notifier:self.serial_No_notifier)
                    
                    Group{
                LabelTextField(label: "RAM Size", placeHolder: "Enter RAM Size", notifier:self.rAM_Size_notifier)
                LabelTextField(label: "RAM Qty.", placeHolder: "Enter RAM Qty.", notifier:self.rAM_Qty_notifier)
                LabelTextField(label: "HDD Size", placeHolder: "Enter HDD Size", notifier:self.hDD_Size_notifier)
                LabelTextField(label: "Description details", placeHolder: "Enter Description details", notifier:self.description_notifier)
                LabelTextField(label: "Warranty Start Date", placeHolder: "Enter Warranty Start Date", notifier:self.warranty_notifier)
                LabelTextField(label: "Invoice No.", placeHolder: "Enter Invoice No.", notifier:self.invoice_No_notifier)
                }
                    
                 }.listRowInsets(EdgeInsets())
                    .navigationBarTitle(Text("Asset Details") , displayMode: .inline)
                    .navigationBarItems(trailing:
                       Button(action: {
                        //print("camera tapped!")
                        withAnimation{
                         //   self.showImagePicker.toggle()
                            self.showActionSheet.toggle()
                        }
                       }) {
                        Image("camera")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .clipped()
                            .scaledToFit()
                        
                    }).actionSheet(isPresented: $showActionSheet, content: {self.actionSheet})
                image?.resizable().frame(width: 100, height: 100)
                               
                if (showImagePicker) {
                   // ImagePicker(isShown: $showImagePicker, image: $image )
                ImagePicker(isCamera: $isCamera, isShown: $showImagePicker, image: $image)
                    
                           }
                if isNewAsset == true{
//                    Button(action: {
//                            print("Save tapped!")
//                        }) {
//                            Text("Save")
//                                .frame(width: 150, height: 40, alignment: .center)
//                                .background(Color.blue)
//                                .cornerRadius(10)
//                                .foregroundColor(.white)
//                                .font(Font.body.bold())
//                    }
                   
                    Button(action: {
                        self.showingAlert = true
                    }) {
                        Text("Save")
                    }.frame(width: 150, height: 40, alignment: .center)
                                                    .background(Color.blue)
                                                    .cornerRadius(10)
                                                    .foregroundColor(.white)
                                                    .font(Font.body.bold())
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Do you want to assign it to Someone?"), primaryButton:.default(Text("Yes")) , secondaryButton: .cancel())
                    }
                
                }
                
            }.padding(.bottom, 5).colorInvert().padding(.top,10)
    }

}

struct AddUser: View {
    
     @State var category_notifier: String = ""
     @State var emp_Name_notifier: String = ""
     @State var emp_Num_notifier: String = ""
     @State var alloc_Date_notifier: String = ""
     @State var floor_notifier: String = ""
     @State var location_notifier: String = ""
     @State var cubicle_notifier: String = ""
     @State var customer_Name_notifier: String = ""
     @State var mobile_Num_notifier: String = ""
     @State var allocStatus:Bool
    
    var body: some View{
            VStack {
                List{
                LabelTextField(label: "Name", placeHolder: "Enter Employee name", notifier:self.emp_Name_notifier)
                LabelTextField(label: "Emp ID", placeHolder: "Enter Employee ID", notifier:self.emp_Num_notifier)
                LabelTextField(label: "Allocation Date", placeHolder: "Enter allocation date", notifier:self.alloc_Date_notifier)
                LabelTextField(label: "Floor", placeHolder: "Enter floor no", notifier:self.floor_notifier)
                LabelTextField(label: "Location", placeHolder: "Enter Location", notifier:self.location_notifier)
                LabelTextField(label: "Cubicle", placeHolder: "Enter Cubicle", notifier:self.cubicle_notifier)
                LabelTextField(label: "Customer Name", placeHolder: "Enter Customer name", notifier:self.customer_Name_notifier)
                LabelTextField(label: "Mobile Number", placeHolder: "Enter Mobile Number", notifier:self.mobile_Num_notifier)
                 }.listRowInsets(EdgeInsets())
                .navigationBarTitle(Text("User Details") , displayMode: .inline)
        
                
                if allocStatus != true{
                    Button(action: {
                        print("save tapped!")

                    }) {
                        Text("Save")
                            .frame(width: 150, height: 40, alignment: .center)

                    }.background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(Font.body.bold())
                    
                }
           
                }.padding(.bottom, 10).padding(.top, 10).colorInvert()
            
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
