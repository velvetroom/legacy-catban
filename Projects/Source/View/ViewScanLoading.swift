import UIKit
import Shared
import Tools

class ViewScanLoading:UIView {
    weak var spinner:Spinner!
    weak var buttonAccept:UIButton!
    weak var buttonContinue:UIButton!
    weak var message:UILabel!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = 0
    }
    
    private func makeOutlets() {
        self.makeSpinner()
        self.makeButtonContinue()
        self.makeButtonAccept()
        self.makeMessage()
    }
    
    private func layoutOutlets() {
        self.layoutSpinner()
        self.layoutButtonContinue()
        self.layoutButtonAccept()
        self.layoutMessage()
    }
    
    private func makeSpinner() {
        let spinner:Spinner = Spinner()
        self.spinner = spinner
        self.addSubview(spinner)
    }
    
    private func makeMessage() {
        let message:UILabel = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.backgroundColor = UIColor.clear
        message.numberOfLines = 0
        message.font = UIFont.systemFont(ofSize:ViewConstants.ScanMessage.fontSize, weight:UIFont.Weight.regular)
        message.textAlignment = NSTextAlignment.center
        self.message = message
        self.addSubview(message)
    }
    
    private func makeButtonContinue() {
        let buttonContinue:UIButton = UIButton()
        buttonContinue.translatesAutoresizingMaskIntoConstraints = false
        buttonContinue.setBackgroundImage(UIImage(name:ViewConstants.ScanActions.assetContinue, in:type(of:self)),
                                          for:UIControlState())
        buttonContinue.setTitleColor(UIColor.white, for:UIControlState.normal)
        buttonContinue.setTitleColor(UIColor(white:1, alpha:0.2), for:UIControlState.highlighted)
        buttonContinue.setTitle(String.localized(key:"ViewScanLoading_ButtonContinue", in:type(of:self)),
                                for:UIControlState())
        buttonContinue.titleLabel!.font = UIFont.systemFont(ofSize:ViewConstants.ScanActions.fontSize,
                                                            weight:UIFont.Weight.bold)
        buttonContinue.isHidden = true
        self.buttonContinue = buttonContinue
        self.addSubview(buttonContinue)
    }
    
    private func makeButtonAccept() {
        let buttonAccept:UIButton = UIButton()
        buttonAccept.translatesAutoresizingMaskIntoConstraints = false
        buttonAccept.setTitleColor(UIColor.black, for:UIControlState.normal)
        buttonAccept.setTitleColor(UIColor(white:0, alpha:0.2), for:UIControlState.highlighted)
        buttonAccept.setTitle(String.localized(key:"ViewScanLoading_ButtonAccept", in:type(of:self)),
                                for:UIControlState())
        buttonAccept.titleLabel!.font = UIFont.systemFont(ofSize:ViewConstants.ScanActions.fontSize,
                                                            weight:UIFont.Weight.bold)
        buttonAccept.isHidden = true
        self.buttonAccept = buttonAccept
        self.addSubview(buttonAccept)
    }
    
    private func layoutSpinner() {
        self.spinner.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.spinner.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
    }
    
    private func layoutButtonContinue() {
        self.buttonContinue.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.buttonContinue.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor,
                                                    constant:ViewConstants.ScanActions.bottom).isActive = true
        self.buttonContinue.widthAnchor.constraint(equalToConstant:ViewConstants.ScanActions.width).isActive = true
        self.buttonContinue.heightAnchor.constraint(equalToConstant:ViewConstants.ScanActions.height).isActive = true
    }
    
    private func layoutButtonAccept() {
        self.buttonAccept.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.buttonAccept.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor,
                                                    constant:ViewConstants.ScanActions.bottom).isActive = true
        self.buttonAccept.widthAnchor.constraint(equalToConstant:ViewConstants.ScanActions.width).isActive = true
        self.buttonAccept.heightAnchor.constraint(equalToConstant:ViewConstants.ScanActions.height).isActive = true
    }
    
    private func layoutMessage() {
        self.message.leftAnchor.constraint(equalTo:self.leftAnchor,
                                           constant:ViewConstants.ScanMessage.margin).isActive = true
        self.message.rightAnchor.constraint(equalTo:self.rightAnchor,
                                            constant:-ViewConstants.ScanMessage.margin).isActive = true
        self.message.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.message.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
    }
}
