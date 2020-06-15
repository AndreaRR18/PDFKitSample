import SwiftUI

struct BasicButton: View {
    
    var action: () -> ()
    var title: String
    
    var body: some View {
        Button(
            action: action,
            label: { Text(title) }
        )
            .frame(width: 200, height: 70)
            .background(Color(red: 182/255, green: 205/255, blue: 200/255))
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(20)
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        BasicButton(action: {}, title: "TEST")
    }
}
