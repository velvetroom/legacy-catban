import UIKit
import AVFoundation
import CleanArchitecture
import Architecture

class PresenterScan:NSObject, PresenterProtocol, AVCaptureMetadataOutputObjectsDelegate {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    var session:AVCaptureSession?
    private var input:AVCaptureInput?
    private var output:AVCaptureMetadataOutput?
    
    override required init() {
        super.init()
        self.startSession()
    }
    
    deinit {
        self.cleanSession()
    }
    
    func close() {
        self.transition?.dismiss()
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
    
    func read(string:String) {
        DispatchQueue.main.async { [weak self] in
            self?.close()
        }
    }
    
    private func startSession() {
        self.session = AVCaptureSession()
        self.session!.sessionPreset = AVCaptureSession.Preset.hd1280x720
        do { try self.input = AVCaptureDeviceInput(device:AVCaptureDevice.default(
            AVCaptureDevice.DeviceType.builtInWideAngleCamera,
            for:AVMediaType.video, position:AVCaptureDevice.Position.back)!) } catch { return }
        self.output = AVCaptureMetadataOutput()
        self.session!.addInput(self.input!)
        self.session!.addOutput(self.output!)
        self.output!.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        self.output!.setMetadataObjectsDelegate(self, queue:DispatchQueue.global(qos:DispatchQoS.QoSClass.background))
        self.session!.startRunning()
    }
    
    private func cleanSession() {
        guard let session:AVCaptureSession = self.session else { return }
        session.stopRunning()
        if let input:AVCaptureInput = self.input { session.removeInput(input) }
        if let output:AVCaptureMetadataOutput = self.output { session.removeOutput(output) }
        self.session = nil
        self.input = nil
        self.output = nil
    }
}
