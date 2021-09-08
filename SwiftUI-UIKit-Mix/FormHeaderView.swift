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
    
    @EnvironmentObject var selectedFormType: CurrentForm
    unowned var delegate: FormTypeHeaderViewDelegate?
    
    var body: some View {
        
        Button(action: {
            buttonWasClicked()
        }, label: {
            HStack {
                Image(selectedFormType.form.imageName())
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                
                Text(selectedFormType.form.description())
                .padding(8)
                
                Spacer()
            }
        })
    }
    
    func buttonWasClicked() {
        delegate?.headerWasClicked()
    }
}

struct FormTypeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FormTypeHeaderView()
    }
}
