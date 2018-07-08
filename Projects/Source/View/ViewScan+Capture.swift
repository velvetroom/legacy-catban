import Foundation
import AVFoundation

extension ViewScan:AVCaptureMetadataOutputObjectsDelegate {
    func read(string:String) {
        DispatchQueue.main.async { [weak self] in
            //            self?.close()
        }
    }
    
    func startSession() {
        let session:AVCaptureSession = AVCaptureSession()
        session.sessionPreset = AVCaptureSession.Preset.hd1280x720
        self.startInput()
        self.startOutput()
        session.startRunning()
        self.content.viewPreview.loadPreview(session:session)
        self.session = session
    }
    
    func cleanSession() {
        guard let session:AVCaptureSession = self.session else { return }
        session.stopRunning()
        if let input:AVCaptureInput = self.input { session.removeInput(input) }
        if let output:AVCaptureMetadataOutput = self.output { session.removeOutput(output) }
        self.session = nil
        self.input = nil
        self.output = nil
    }
    
    private func startInput() {
        guard
            let device:AVCaptureDevice = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera,
                                                                 for:AVMediaType.video,
                                                                 position:AVCaptureDevice.Position.back)
            else { return }
        let input:AVCaptureDeviceInput
        do { try input = AVCaptureDeviceInput(device:device) } catch { return }
        self.session?.addInput(input)
        self.input = input
    }
    
    private func startOutput() {
        let output:AVCaptureMetadataOutput = AVCaptureMetadataOutput()
        self.session?.addOutput(output)
        if output.availableMetadataObjectTypes.contains(AVMetadataObject.ObjectType.qr) {
            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        }
        output.setMetadataObjectsDelegate(self, queue:DispatchQueue.global(qos:DispatchQoS.QoSClass.background))
        self.output = output
    }
}
