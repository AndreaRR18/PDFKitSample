import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: IdentityCardView()) {
                    Text("Select Identity card")
                        .frame(width: 200, height: 70)
                        .background(Color(red: 182/255, green: 205/255, blue: 200/255))
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(20)
                }
                
                Spacer().frame(height: 70)
                
                NavigationLink(destination: GenericDocument()) {
                    Text("Get generic document")
                        .frame(width: 200, height: 70)
                        .background(Color(red: 182/255, green: 205/255, blue: 200/255))
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(20)
                }
            }
            .navigationBarTitle("PDFKit")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
