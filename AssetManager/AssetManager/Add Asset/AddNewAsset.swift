//
//  AddNewAsset.swift
//  AssetManager
//
//  Created by suram.tejaswini on 10/09/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import Foundation
import SwiftUI

//struct AddNewAsset:View {
//
//    var body: some View{
//           Text("Hello World")
//    }
//}
//
//#if DEBUG
//struct AddNewAsset_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewAsset()
//    }
//}
//#endif

final class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tapping the image view brings up the photo picker.
//        let photoTap = UITapGestureRecognizer(target: self, action: #selector(promptPhoto))
//        self.view.addGestureRecognizer(photoTap)
        
        // Prompt user for a photo shortly after launch
        //perform(#selector(promptPhoto), with: nil, afterDelay: 0.1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if imageView.image == nil {
//            promptPhoto()
//        }
    }
}
extension ViewController: UIViewControllerRepresentable {
    public typealias UIViewControllerType = ViewController

    public func makeUIViewController(context: UIViewControllerRepresentableContext<ViewController>) -> ViewController {
        return ViewController()
    }

    public func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<ViewController>) {
        //
    }
}
