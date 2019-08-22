//
//  AssetModel.swift
//  AssetManager
//
//  Created by Pradumna Patil on 8/20/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AssetModel: ObservableObject, Identifiable {
    
    
    init() {
        addAssets()
    }
    
    var listArray = [Asset]() {
        didSet {
            didChange.send(self)
        }
    }
    
    let didChange = PassthroughSubject<AssetModel, Never>()
    
    fileprivate func addAssets() {
        for i in 1...100 {
            listArray.append(Asset(id: i, assetID: 20949, assetCode: "DES/\(004951+i)", building: "2nd floor GAR Infobahn HYD Corp area", hostName: "EXIHYD-IM-\(057+i)", manufacturer: "Apple", modelNo: "iMac (21.5-inch, 2017)", serialNumber: generateRandomSerialNumber(), rAMSize: "16GB", rAMQty: 2, hDDSize: "1TB", hDDQty: 1, descriptionDetails: "2.3 GHz Intel Core i5", warrantyStartDate: "2018-10-03 0:00:00", invoiceNo: "Invoice No: SEZ1819D1215, PO: 1819/EXL/HYD/IT/0000012", allocStatus: self.randomBool()))
        }
    }
    
    fileprivate func generateRandomSerialNumber() -> String {
        
        let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< 12 {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
        
        
    }

    fileprivate func randomBool() -> Bool {
        let randomNo = Int.random(in: 0...1)
        return randomNo % 2 == 0 ? true : false
    }

}
