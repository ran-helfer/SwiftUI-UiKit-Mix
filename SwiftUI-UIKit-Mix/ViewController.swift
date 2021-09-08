//
//  ViewController.swift
//  SwiftUI-UIKit-Mix
//
//  Created by Ran Helfer on 08/09/2021.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    /*
        The purpose of this excersize is to demonstrate how a swiftUIContainer can be integrated into UIView along with sending messages to the host controller
     */
    
    
    @IBOutlet weak var swiftUIContainer: UIView!
    @IBOutlet weak var uikitView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostView = UIHostingController(rootView: FormTypeHeaderView(delegate: self))

        addChild(hostView)
        swiftUIContainer.addSubview(hostView.view)
        setConstraints(hostView: hostView)
    }

    func setConstraints(hostView: UIHostingController<FormTypeHeaderView>) {
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        hostView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        hostView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        /* We want the host bottom to be the top of UIKit */
        hostView.view.bottomAnchor.constraint(equalTo: uikitView.topAnchor).isActive = true
    }

    
}

extension ViewController: FormTypeHeaderViewDelegate {
    func headerWasClicked() {
        print("will push")
    }
}
