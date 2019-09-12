//
//  CameraViewController.swift
//  AssetManager
//
//  Created by Pradumna Patil on 9/10/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit
import SwiftUI
import  Vision

final class CameraViewController: UIPageViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }
}

//struct ViewControllerWrapper: UIViewControllerRepresentable {
//
//    typealias UIViewControllerType = CameraViewController
//
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewControllerWrapper.UIViewControllerType {
//        return CameraViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
//
//    }
//}
struct ImagePicker: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        //uiViewController.sourceType = .photoLibrary
        if(isCamera == true){
            uiViewController.sourceType = .camera
        }else{
            uiViewController.sourceType = .photoLibrary
        }
    }
    
@Binding var isCamera : Bool
@Binding var isShown: Bool
@Binding var image: Image?

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @Binding var isShown: Bool
    @Binding var image: Image?

    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image = image
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        
        // Extract chosen image.
        let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        // Display image on screen.
        image = Image(uiImage: originalImage)
        
        
        // Fire off request based on URL of chosen photo.
        guard let cgImage = originalImage.cgImage else {
            return
        }
        performVisionRequest(image: cgImage)
        
        // Dismiss the picker to return to original view controller.
        //dismiss(animated: true, completion: nil)
        isShown = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    // - Tag: PerformRequests
         fileprivate func performVisionRequest(image: CGImage) {
             

             if #available(iOS 13.0, *) {
                 self.detectText(cgImage: image)
             } else {
                 // Fallback on earlier versions
             }
     
         }
    @available(iOS 13.0, *)
    func detectText(cgImage: CGImage) {
        let imageHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let textRequest = VNRecognizeTextRequest { (req, err) in
           // print(req.results)
            guard let observations = req.results as? [VNRecognizedTextObservation]else{return}
            for currentObsr in observations{
                let topc = currentObsr.topCandidates(1)
                if let rtext = topc.first{
                    print(rtext.string)
                }
            }
            
        }
        textRequest.recognitionLevel = .accurate
        try? imageHandler.perform([textRequest])
    }
}

func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, image: $image)
}

func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
}
 

}

