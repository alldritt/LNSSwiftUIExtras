//
//  URL+Extras.swift
//  LNSSwiftUIExtras
//
//  Created by Mark Alldritt on 2025-03-17.
//

import Foundation


extension URL {
    static public func temporaryURL(name: String? = nil) -> URL {
        let tempDir = FileManager.default.temporaryDirectory
        let tempName = name ?? "\(ProcessInfo.processInfo.globallyUniqueString).tmp"
        
        return URL(fileURLWithPath: tempName, relativeTo: tempDir)
    }
}
