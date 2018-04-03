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
        self.factoryText()
    }
    
    private func factoryText() {
        let viewText:WriterViewText = WriterViewText()
        self.outletsList.viewText = viewText

        self.view.addSubview(viewText)
        
        viewText.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        self.outletsList.layoutTextBottom = viewText.bottomAnchor.constraint(equalTo:self.view.bottomAnchor)
        viewText.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        viewText.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        self.outletsList.layoutTextBottom?.isActive = true
    }
}
