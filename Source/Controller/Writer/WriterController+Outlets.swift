import UIKit

extension WriterController {
    private var outletsList:WriterPresenterOutletsList {
        get {
            return self.model.presenter.outlets.list
        }
        
        set(newValue) {
            self.model.presenter.outlets.list = newValue
        }
    }
    
    func factoryOutlets() {
        self.factoryBar()
        self.factoryText()
    }
    
    private func factoryText() {
        let viewText:WriterViewText = WriterViewText()
        viewText.text = self.model.text
        viewText.delegate = self
        self.outletsList.viewText = viewText

        self.view.addSubview(viewText)
        
        viewText.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        viewText.bottomAnchor.constraint(equalTo:self.outletsList.viewBar!.topAnchor).isActive = true
        viewText.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        viewText.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
    }
    
    private func factoryBar() {
        let viewBar:WriterViewBar = WriterViewBar()
        viewBar.buttonDone.addTarget(self, action:#selector(self.selectorDone(sender:)),
                                     for:UIControlEvents.touchUpInside)
        self.outletsList.viewBar = viewBar
        
        self.view.addSubview(viewBar)
        
        viewBar.heightAnchor.constraint(equalToConstant:Constants.barHeight).isActive = true
        self.outletsList.layoutBarBottom = viewBar.bottomAnchor.constraint(equalTo:self.view.bottomAnchor)
        viewBar.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        viewBar.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        self.outletsList.layoutBarBottom?.isActive = true
    }
}
