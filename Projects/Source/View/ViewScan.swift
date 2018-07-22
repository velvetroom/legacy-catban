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
        self.hookSelectors()
        self.startSession()
        self.configureViewModel()
    }
    
    override func orientationChanged(size:CGSize) {
        super.orientationChanged(size:size)
        self.view.frame = CGRect(origin:CGPoint.zero, size:size)
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
    
    @objc func selectorClose() {
        self.presenter.close()
    }
    
    private func hookSelectors() {
        self.content.viewLoading.buttonAccept.addTarget(self, action:#selector(self.selectorClose),
                                                        for:UIControlEvents.touchUpInside)
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelScan = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelScan) in
            self?.updated(viewModel:property)
        }
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelScan) {
        self.content.viewLoading.buttonAccept.isHidden = viewModel.buttonAcceptHidden
        self.content.viewLoading.buttonContinue.isHidden = viewModel.buttonContinueHidden
        self.content.viewLoading.message.text = viewModel.message
        if viewModel.spinnerAnimating {
            self.content.viewLoading.spinner.startAnimating()
        } else {
            self.content.viewLoading.spinner.stopAnimating()
        }
    }
}
