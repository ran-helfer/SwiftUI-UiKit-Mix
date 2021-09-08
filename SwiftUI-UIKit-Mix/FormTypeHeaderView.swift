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
