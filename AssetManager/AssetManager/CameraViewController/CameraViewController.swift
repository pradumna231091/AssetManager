//
//  CameraViewController.swift
//  AssetManager
//
//  Created by Pradumna Patil on 9/10/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit
import SwiftUI

final class CameraViewController: UIPageViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }
}

struct ViewControllerWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = CameraViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewControllerWrapper.UIViewControllerType {
        return CameraViewController()
    }

    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
    }
}
