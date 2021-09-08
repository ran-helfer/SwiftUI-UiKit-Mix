//
//  FormSelectionView.swift
//  SwiftUI-UIKit-Mix
//
//  Created by Ran Helfer on 08/09/2021.
//

import SwiftUI

protocol FormSelectionViewDelegate: AnyObject {
    func selectedForm(_ form: FormType)
}

struct FormSelectionView: View {
    
    unowned var delegate: FormSelectionViewDelegate?

    var body: some View {
        VStack {
            ForEach(0 ..< FormType.allCases.count) { index in
                Button(action: {
                    delegate?.selectedForm(FormType.cases[index])
                }, label: {
                    HStack {
                        let formCase = FormType.cases[index]
                        Image(formCase.imageName())
                            .frame(width: 40, height: 40, alignment: .center)
                            .clipShape(Circle())
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        
                        Text(formCase.description())
                            .padding(8)
                        
                        Spacer()
                    }
                })
            }
        }.padding(EdgeInsets(top: 32, leading: 16, bottom: 0, trailing: 0))
        Spacer()

    }
}

struct FormSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FormSelectionView()
    }
}
