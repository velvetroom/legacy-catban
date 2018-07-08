import UIKit
import AVFoundation
import Architecture
import Shared

class ViewScan:Architecture.View<PresenterScan, ViewScanContent> {
    var session:AVCaptureSession?
    var input:AVCaptureInput?
    var output:AVCaptureMetadataOutput?
    
    deinit {
        self.cleanSession()
    }
    
    override var prefersStatusBarHidden:Bool {
        get {
            return true
        }
    }
    
    override func initProperties() {
        super.initProperties()
        self.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalPresentationCapturesStatusBarAppearance = true
    }
    
    override func didLoad() {
        super.didLoad()
        self.makeBarActions()
        self.startSession()
    }
    
    override func orientationChanged(size:CGSize) {
        super.orientationChanged(size:size)
        self.view.frame = CGRect(origin:CGPoint.zero, size:size)
    }
    
    @objc func selectorClose() {
        self.presenter.close()
    }
    
    func metadataOutput(_:AVCaptureMetadataOutput, didOutput objects:[AVMetadataObject], from:AVCaptureConnection) {
        guard
            let object:AVMetadataMachineReadableCodeObject = objects.first as? AVMetadataMachineReadableCodeObject,
            let string:String = object.stringValue
        else { return }
        self.cleanSession()
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        self.read(string:string)
    }
}
