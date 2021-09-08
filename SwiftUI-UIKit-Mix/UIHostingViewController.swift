//
//  UIHostingViewController.swift
//  SwiftUI-UIKit-Mix
//
//  Created by Ran Helfer on 08/09/2021.
//

import UIKit
import SwiftUI

class UIHostingViewController<T:
View>: UIViewController {

    var hostView: UIHostingController<T>?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let hostView = self.hostView {
            addChild(hostView)
            self.view.addSubview(hostView.view)
            setConstraints(hostView: hostView)
        }
    }

    func setConstraints(hostView: UIHostingController<T>) {
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        hostView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        hostView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        hostView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    


}
