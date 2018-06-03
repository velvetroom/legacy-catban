import UIKit
import Shared

class PresenterOutletsLoader {
    weak var view:Shared.View!
    private var outlets:PresenterOutlets
    private var safeArea:UILayoutGuide {
        get {
            return self.view.view.safeAreaLayoutGuide
        }
    }
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func loadOulets() -> PresenterOutlets {
        self.loadView()
        self.loadText()
        return self.outlets
    }
    
    private func loadView() {
        self.outlets.view = self.view
        self.view.view.backgroundColor = UIColor.white
    }
    
    private func loadText() {
        let viewText:ViewText = ViewText()
        self.outlets.viewText = viewText
        self.view.view.addSubview(viewText)
        
        viewText.layoutBottom = viewText.bottomAnchor.constraint(equalTo:self.safeArea.bottomAnchor)
        viewText.topAnchor.constraint(equalTo:self.safeArea.topAnchor).isActive = true
        viewText.leftAnchor.constraint(equalTo:self.safeArea.leftAnchor).isActive = true
        viewText.rightAnchor.constraint(equalTo:self.safeArea.rightAnchor).isActive = true
        viewText.layoutBottom.isActive = true
    }
}
