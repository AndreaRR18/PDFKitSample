import SwiftUI
import PDFCreator

struct GenericDocument: View {
    @State private var isShowPicker: Bool = false
    @State private var isShowPDFView: Bool = false
    
    @State private var pickedImageList: [PickedImage] = []
    
    var body: some View {
        VStack {
            
            List {
                ForEach(pickedImageList) { pickedImage in
                    ImageRow(image: Image(uiImage: UIImage(data: pickedImage.data)!))
                }
            }
            
            Spacer()
            
            BasicButton(
                action: { self.isShowPicker.toggle() },
                title: "Add"
            )
            
            Spacer().frame(height: 10)
        }
            
        .navigationBarTitle("Generic document")
            
        .sheet(
            isPresented: $isShowPicker,
            content: {
                ImagePicker { pickedImage in
                    self.pickedImageList.append(pickedImage)
                }
        })
            
            .navigationBarItems(trailing: Button(
                action: { self.isShowPDFView.toggle() },
                label: { Text("Generate") })
                .disabled(pickedImageList.isEmpty)
                .sheet(isPresented: self.$isShowPDFView,
                       content: {
                        PDFReaderView(pdfData:
                            GenericDocumentPDFCreator(
                                images: self.pickedImageList
                                    .map(\.data)
                                    .map(UIImage.init(data:))
                                    .compactMap { $0 }
                            ).createPDF()
                        )
                })
        )
    }
}

struct GenericDocument_Previews: PreviewProvider {
    static var previews: some View {
        GenericDocument()
    }
}
