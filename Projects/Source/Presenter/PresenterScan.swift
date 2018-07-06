import UIKit
import AVFoundation
import CleanArchitecture
import Architecture

class PresenterScan:NSObject, PresenterProtocol, AVCaptureMetadataOutputObjectsDelegate {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    let session:AVCaptureSession
    private let device:AVCaptureDevice
    private let input:AVCaptureInput!
    private let output:AVCaptureMetadataOutput
    
    override required init() {
        self.session = AVCaptureSession()
        self.device = AVCaptureDevice.default(for:AVMediaType.video)!
        do { try self.input = AVCaptureDeviceInput(device:self.device) } catch { self.input = nil }
        self.session.addInput(self.input)
        self.output = AVCaptureMetadataOutput()
        self.session.addOutput(self.output)
        
        
        self.output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        super.init()
        
        self.output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            print("found: \(readableObject.stringValue!)")
            //captureSession.stopRunning()
        }
    }
    
    func close() {
        self.transition?.dismiss()
    }
}
