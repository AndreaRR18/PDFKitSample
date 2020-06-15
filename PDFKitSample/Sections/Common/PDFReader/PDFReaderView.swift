import SwiftUI

struct PDFReaderView : UIViewControllerRepresentable {
   
    var pdfData: Data
    
    
    func makeUIViewController(context: Context) -> UINavigationController {
            
        let pdfReaderViewController = PDFReaderViewController()
        pdfReaderViewController.showPDF(data: pdfData)
        
        let navController = UINavigationController(rootViewController: pdfReaderViewController)
        
        return navController
    }
    
    

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Empty.
    }
}
