//
//  Optional+KinWallet.swift
//  KinWallet
//
//  Copyright © 2018 KinFoundation. All rights reserved.
//

import Foundation

extension Optional where Wrapped == [Offer] {
    var count: Int {
        if let unwrapped = self {
            return unwrapped.count
        }

        return 0
    }
}

extension Optional where Wrapped == Bool {
    var boolValue: Bool {
        if let unwrapped = self {
            return unwrapped
        }

        return false
    }
}

extension Optional where Wrapped == String {
    var isEmpty: Bool {
        if let unwrapped = self {
            return unwrapped.isEmpty
        }

        return true
    }
}
