import SwiftUI

struct ImageRow: View {
    
    @State var image: Image
    
    var body: some View {
        GeometryReader { geometry in
            self.image
                .frame(width: geometry.size.width)
                .aspectRatio(contentMode: .fit)
        }
        .frame(height: 150)
        .clipped()
        .cornerRadius(10)
    }
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        ImageRow(image: Image(systemName: "list.dash"))
    }
}
