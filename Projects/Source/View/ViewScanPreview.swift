import UIKit
import AVFoundation

class ViewScanPreview:UIView {
    weak var previewLayer:AVCaptureVideoPreviewLayer!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }

    override func layoutSubviews() {
        self.previewLayer.frame = self.bounds
        super.layoutSubviews()
    }
    
    func loadPreview(session:AVCaptureSession) {
        let previewLayer:AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session:session)
        self.previewLayer = previewLayer
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.layer.addSublayer(previewLayer)
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.isUserInteractionEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.black
    }
}
