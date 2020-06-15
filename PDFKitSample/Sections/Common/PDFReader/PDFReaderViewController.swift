import UIKit
import PDFKit

class PDFReaderViewController: UIViewController {
    
    private let pdfView = PDFView()
    private let pdfThumbnailsView = PDFThumbnailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(close))
    }
    
    func showPDF(data: Data) {
        let document = PDFDocument(data: data)
        pdfView.document = document
        pdfThumbnailsView.pdfView = pdfView
        
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
