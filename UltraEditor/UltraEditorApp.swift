//
//  UltraDocApp.swift
//  UltraDoc
//
//  Created by jpb on 16/06/2024.
//

import SwiftUI

@main
struct UltraDocApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: UltraDocDocument()) { file in
            ContentView(document: file.$document)
        }
        
    }
}
