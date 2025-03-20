//
//  ContentView.swift
//  UltraDoc
//
//  Created by jpb on 16/06/2024.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: UltraDocDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(UltraDocDocument()))
    }
}
