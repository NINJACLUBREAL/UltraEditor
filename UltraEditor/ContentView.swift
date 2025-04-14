import SwiftUI


struct ContentView: View {
   
    // Binding to the document's data
    @Binding var document: UltraDocDocument
    
    var body: some View {
        VStack {
            // TextEditor for editing the document's text, with dynamic font size
            TextEditor(text: $document.text)
                .font(.system(size: document.fontSize))
            SwiftUICore.HStack {
                
               
                Text("More soon!")
                    .frame(width: 100)
                    .lineLimit(1)
                
                
                
                
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
                Link("Github",
                      destination: URL(string: "https://github.com/errortek/UltraEditor")!)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(UltraDocDocument()))
    }
}



