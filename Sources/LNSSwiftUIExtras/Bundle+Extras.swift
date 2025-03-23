//
//  Bundle+Extras.swift
//  LNSSwiftUIExtras
//
//  Created by Mark Alldritt on 2025-03-22.
//

import Foundation


extension Bundle {
    /// Application name shown under the application icon.
    public var applicationName: String? {
        object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
            object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
