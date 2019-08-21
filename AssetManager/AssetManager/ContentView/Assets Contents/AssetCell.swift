//
//  AssetCell.swift
//  AssetManager
//
//  Created by Pradumna Patil on 8/14/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import SwiftUI

struct AssetCell: View {
    var model:Asset
    var isAllocated:Bool
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if isAllocated == true {
                StatusView() .background(Color.red)
            } else {
                StatusView() .background(Color.green)
            }
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
