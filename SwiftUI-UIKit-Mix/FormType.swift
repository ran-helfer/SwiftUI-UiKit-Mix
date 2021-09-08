//
//  FormEnum.swift
//  SwiftUI-UIKit-Mix
//
//  Created by Ran Helfer on 08/09/2021.
//

import Foundation

enum FormType: CaseIterable {
    case general
    case stroke
    case pulmonaryEmoblism
    case aortic
    case cryptoGenic

    static var cases: [FormType] = [
        FormType.general,
        FormType.stroke,
        FormType.pulmonaryEmoblism,
        FormType.aortic,
        FormType.cryptoGenic,
    ]
    
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
