import UIKit
import PDFKit

public class IdentityCardPDFCreator: NSObject {
    
    let frontImage: UIImage
    let rearImage: UIImage
    
    public init(frontImage: UIImage, rearImage: UIImage) {
        self.frontImage = frontImage
        self.rearImage = rearImage
    }
    
    public func createPDF() -> Data {
        
        let format = UIGraphicsPDFRendererFormat()
        
        //8.5 and 11 are the standard US letter size
        //8.26 and 11.69 are the standard A4
        //72 are the points per inch, we must multiply the width and height per 72
        let pageWidth = 8.26 * 72.0
        let pageHeight = 11.69 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        let data = renderer.pdfData { (context) in
            
            //call beginPage before giving any other drawing instructions
            //call beginPage multiple times to create a multi-page PDF
            context.beginPage()
            
            let frontImageBottom = addImage(pageRect: pageRect, marginTop: 18.0, image: frontImage)
            _ = addImage(pageRect: pageRect, marginTop: frontImageBottom + 18.0, image: rearImage)
    
        }
        
        return data
    }
    
    func addImage(pageRect: CGRect, marginTop: CGFloat, image: UIImage) -> CGFloat {
        
        let maxHeight = pageRect.height * 0.4
        let maxWidth = pageRect.width * 0.8
        
        let aspectWidth = maxWidth / image.size.width
        let aspectHeight = maxHeight / image.size.height
        let aspectRatio = min(aspectWidth, aspectHeight)
        
        let scaledWidth = image.size.width * aspectRatio
        let scaledHeight = image.size.height * aspectRatio
        
        let imageX = (pageRect.width - scaledWidth) / 2.0
        let imageRect = CGRect(x: imageX, y: marginTop,
                               width: scaledWidth, height: scaledHeight)
        
        image.draw(in: imageRect)
        return imageRect.origin.y + imageRect.size.height
    }
    
}
