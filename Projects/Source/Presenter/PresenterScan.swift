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
        
        
        self.output.metadataObjectTypes = [AVMetadataObject.ObjectType.ean8, AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.pdf417]
        
        super.init()
        
        self.output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        
    }
    
    func close() {
        self.transition?.dismiss()
    }
}
