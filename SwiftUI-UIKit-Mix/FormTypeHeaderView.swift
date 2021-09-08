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

enum FormType: CaseIterable {
    case stroke
    case covid
    case lungs
    
    func allCasesArray() -> [String] {
        [FormType.stroke.description(),
         FormType.covid.description(),
         FormType.lungs.description()]
    }
    
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
        
        ZStack {
            
            /*
             
             This result with a bug:
             https://stackoverflow.com/questions/64124502/swiftui-navigationview-trying-to-pop-to-missing-destination-monoceros
             
             I see on terminal:
             Trying to pop to a missing destination at /Library/Caches/com.apple.xbs/Sources/Monoceros_Sim/Monoceros-133.1/Shared/NavigationBridge_PhoneTV.swift:350
             
             */
            VStack {
                Form {
                    Picker(selectedFormType.description(), selection: $selectedFormType) {
                        ForEach(selectedFormType.allCasesArray(), id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
        }
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
