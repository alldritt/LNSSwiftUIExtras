//
//  URL+Extras.swift
//  LNSSwiftUIExtras
//
//  Created by Mark Alldritt on 2025-03-17.
//

import Foundation


extension URL {
    func temporaryURL(name: String?) -> URL {
        let tempDir = URL.temporaryDirectory
        let tempName = name ?? "\(ProcessInfo.processInfo.globallyUniqueString).tmp"
        
        return URL(fileURLWithPath: tempName, relativeTo: tempDir)
    }
}
