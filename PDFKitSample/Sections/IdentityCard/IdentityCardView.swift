import SwiftUI
import PDFCreator

struct IdentityCardView: View {
    
    @State private var isShowPicker: Bool = false
    @State private var isShowPDFView: Bool = false
    
    @State private var frontImage: PickedImage?
    @State private var rearImage: PickedImage?
    
    var body: some View {
        
        VStack {
            
            if self.frontImage != nil {
                
                Image(uiImage: UIImage(data: frontImage!.data)!)
                    .frame(width: 350, height: 150)
                    .clipped()
                
            } else {
                
                BasicButton(
                    action: { self.isShowPicker.toggle() },
                    title: "Add front Identity card"
                )
                    .sheet(
                        isPresented: self.$isShowPicker,
                        content: { ImagePicker {
                            self.frontImage = $0
                            }
                    })
            }
            
            Spacer().frame(height: 50)
            
            if self.rearImage != nil {
                
                Image(uiImage: UIImage(data: rearImage!.data)!)
                    .frame(width: 350, height: 150)
                    .clipped()
                
            } else {
                
                BasicButton(
                    action: { self.isShowPicker.toggle() },
                    title: "Add rear Identity card"
                )
                    .sheet(
                        isPresented: self.$isShowPicker,
                        content: {
                            ImagePicker { pickedImage in
                                self.rearImage = pickedImage
                            }
                    })
            }
        }
            
        .navigationBarTitle("Identity card photo")
            
        .navigationBarItems(trailing: Button(
            action: { self.isShowPDFView.toggle() },
            label: { Text("Generate") })
            .disabled((frontImage == nil || rearImage == nil))
            
            .sheet(isPresented: self.$isShowPDFView,
                   content: {
                    PDFReaderView(pdfData: IdentityCardPDFCreator(
                        frontImage: UIImage(data: self.frontImage!.data)!,
                        rearImage: UIImage(data: self.rearImage!.data)!
                    ).createPDF()
                    )
            })
        )
        
    }
    
}

struct IdentityCardView_Previews: PreviewProvider {
    static var previews: some View {
        IdentityCardView()
    }
}
