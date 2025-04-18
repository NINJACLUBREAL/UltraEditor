import SwiftUI


struct ContentView: View {
    var body: some View {
        
        
        
        VStack {
            // TextEditor for editing the document's text, with dynamic font size
            TextEditor(text: $document.text)
                .font(.system(size: document.fontSize))
            SwiftUICore.HStack {
                
               
             Text("Your Version is 1.6")
                Link("Updates",
                      destination: URL(string: "https://github.com/NINJACLUBREAL/UltraEditor/releases/tag/1.5")!)
                
                
                
                
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
               
            }
        }
        VStack {
         
        }
    }
    // Binding to the document's data
    @Binding var document: UltraDocDocument
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(UltraDocDocument()))
    }
}



