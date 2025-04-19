// UltraDocDocument.swift
// UltraDoc
//
// Created by jpb on 16/06/2024.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var UltraDoc: UTType {
        UTType(importedAs: "com.jpb.ultradoc")
    }
}

struct UltraDocDocument: FileDocument {
    var text: String
    var fontSize: CGFloat = 12 // Default font size

    init(text: String = "", fontSize: CGFloat = 12) {
        self.text = text
        self.fontSize = fontSize
    }

    static var readableContentTypes: [UTType] { [.UltraDoc] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8) else {
            throw CocoaError(.fileReadCorruptFile)
        }

        // Attempt to decode font size if present (assuming it was encoded as part of the data)
        if let decodedData = try? JSONDecoder().decode(DocumentData.self, from: data) {
            text = decodedData.text
            fontSize = decodedData.fontSize
        } else {
            // Fallback to plain text if decoding fails
            text = string
        }
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        // Encode both text and fontSize as JSON
        let documentData = DocumentData(text: text, fontSize: fontSize)
        let data = try JSONEncoder().encode(documentData)
        return .init(regularFileWithContents: data)
    }

    // Struct to hold text and fontSize for encoding/decoding
    struct DocumentData: Codable {
        var text: String
        var fontSize: CGFloat
    }
}
