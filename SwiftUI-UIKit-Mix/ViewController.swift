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
    var form = SelectedFormType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = FormTypeHeaderView(form: form, delegate: self)
        let hostView = UIHostingController(rootView: view)
        setSwiftUIView(hostView: hostView)
    }

    func setSwiftUIView(hostView: UIHostingController<FormTypeHeaderView>) {
        
        /* Guard here in case we do not need the view */
        
        let hostView = UIHostingController(rootView: FormTypeHeaderView(form: form,
                                                                        delegate: self))
        addChild(hostView)
        swiftUIContainer.addSubview(hostView.view)
        
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
        let hostingViewController = UIHostingViewController<FormSelectionView>()
        hostingViewController.hostView  = UIHostingController(rootView: FormSelectionView(delegate: self))
        navigationController?.pushViewController(hostingViewController, animated: true)
    }
}


extension ViewController: FormSelectionViewDelegate {
    func selectedForm(_ form: FormType) {
        navigationController?.popViewController(animated: true)
        self.form.formType = form
    }
}
