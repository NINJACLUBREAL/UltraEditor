import SwiftUI


struct ContentView: View {
   
    // Binding to the document's data
    @Binding var document: UltraDocDocument
    
    var body: some View {
        VStack {
            // TextEditor for editing the document's text, with dynamic font size
            TextEditor(text: $document.text)
                .font(.system(size: document.fontSize))
            HStack {
                // Button to decrease font size
                Button("-") {
                    document.fontSize = max(1, document.fontSize - 1) // Prevent size from going below 1
                }
                // Display current font size
                Text("Font Size: \(Int(document.fontSize))")
                // Button to increase font size
                Button("+") {
                    document.fontSize += 1
                }
                Text("Your Version is 1.6.1")
                   Link("Updates", destination: URL(string: "https://github.com/NINJACLUBREAL/UltraEditor/releases/latest")!)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(UltraDocDocument()))
    }
}



