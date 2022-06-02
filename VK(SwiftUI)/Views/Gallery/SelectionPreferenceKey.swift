//
//  SelectionPreferenceKey.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 31.05.2022.
//

import Foundation
import SwiftUI

struct SelectionPreferenceKey: PreferenceKey {

    static var defaultValue: Anchor<CGRect>? = nil

    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
}

