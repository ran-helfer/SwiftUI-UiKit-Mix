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
    case general
    case stroke
    case pulmonaryEmoblism
    case aortic
    case cryptoGenic

    func description() -> String {
        switch self {
        case .general:
            return "General"
        case .stroke:
            return "Stroke From"
        case .pulmonaryEmoblism:
            return "Pulmonary Embolism"
        case .aortic:
            return "Aortic Disease"
        case .cryptoGenic:
            return "CryptoGenic Stroke"
 
        }
    }
    
    func imageName() -> String {
        switch self {
        case .general:
            return "1"
        case .stroke:
            return "2"
        case .pulmonaryEmoblism:
            return "3"
        case .aortic:
            return "4"
        case .cryptoGenic:
            return "5"
 
        }
    }
    
    mutating func move() {
        switch self {
        case .general:
            self = .stroke
        case .stroke:
            self = .pulmonaryEmoblism
        case .pulmonaryEmoblism:
            self = .general
        case .aortic:
            self = .cryptoGenic
        case .cryptoGenic:
            self = .general
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
            HStack {
                Image(selectedFormType.imageName())
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                
                Text(selectedFormType.description())
                .padding(8)
                
                Spacer()
            }
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
