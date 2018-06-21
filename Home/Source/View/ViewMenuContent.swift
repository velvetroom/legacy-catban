import UIKit

class ViewMenuContent:UIView {
    weak var viewBackground:ViewMenuBackground!
    weak var viewClose:ViewMenuClose!
    weak var viewOptions:ViewMenuOptions!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func animateOpen() {
        self.animateTranslationOpen()
        self.viewClose.animateOpen()
        self.viewBackground.animateOpen()
        self.viewOptions.animateOpen()
    }
    
    func animateClose() {
        self.animateTranslationClose()
        self.viewClose.animateClose()
        self.viewBackground.animateClose()
        self.viewOptions.animateClose()
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.clear
    }
    
    private func factoryViews() {
        self.factoryBackground()
        self.factoryOptions()
        self.factoryClose()
    }
    
    private func factoryBackground() {
        let viewBackground:ViewMenuBackground = ViewMenuBackground()
        self.viewBackground = viewBackground
        
        self.addSubview(viewBackground)

        viewBackground.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        viewBackground.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewBackground.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func factoryClose() {
        let viewClose:ViewMenuClose = ViewMenuClose()
        self.viewClose = viewClose
        
        self.addSubview(viewClose)
        
        viewClose.layoutAlignRight = viewClose.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor)
        viewClose.layoutCentre = viewClose.centerXAnchor.constraint(equalTo:self.centerXAnchor)
        viewClose.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        viewClose.heightAnchor.constraint(equalToConstant:ViewConstants.Close.height).isActive = true
        viewClose.widthAnchor.constraint(equalToConstant:ViewConstants.Close.width).isActive = true
        viewClose.layoutAlignRight.isActive = true
    }
    
    private func factoryOptions() {
        let viewOptions:ViewMenuOptions = ViewMenuOptions()
        self.viewOptions = viewOptions
        
        self.addSubview(viewOptions)
        
        viewOptions.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        viewOptions.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        viewOptions.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewOptions.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func animateTranslationOpen() {
        self.viewClose.layoutAlignRight.isActive = false
        self.viewClose.layoutCentre.isActive = true
        UIView.animate(withDuration:ViewConstants.Base.translationClose) { [weak self] in
            self?.layoutIfNeeded()
        }
    }
    
    private func animateTranslationClose() {
        self.viewClose.layoutCentre.isActive = false
        self.viewClose.layoutAlignRight.isActive = true
        UIView.animate(withDuration:ViewConstants.Base.translationClose) { [weak self] in
            self?.layoutIfNeeded()
        }
    }
}
