//
//  FormTypeHeaderView.swift
//  SwiftUI-UIKit-Mix
//
//  Created by Ran Helfer on 08/09/2021.
// 

import SwiftUI

protocol FormTypeHeaderViewDelegate: AnyObject {
    func headerWasClicked()
}

enum FormType {
    case stroke
    case covid
    case lungs
    
    func description() -> String {
        switch self {
        case .stroke:
            return "Stroke"
        case .covid:
            return "Covid"
        case .lungs:
            return "Lungs"
        }
    }
    
    mutating func move() {
        switch self {
        case .stroke:
            self = .covid
        case .covid:
            self = .lungs
        case .lungs:
            self = .stroke
        }
    }
}

struct FormTypeHeaderView: View {
    
    @State private var selectedFormType = FormType.stroke
    unowned var delegate: FormTypeHeaderViewDelegate?
    
    var body: some View {
        
        Button(action: {
            buttonWasClicked()
        }, label: {
            Text(selectedFormType.description())
        })
    }
    
    func buttonWasClicked() {
        selectedFormType.move()
        delegate?.headerWasClicked()
    }
}

struct FormTypeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FormTypeHeaderView()
    }
}
