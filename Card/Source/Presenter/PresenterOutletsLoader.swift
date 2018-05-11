import UIKit
import Shared

class PresenterOutletsLoader {
    var outlets:PresenterOutlets
    private weak var view:Shared.View!
    private var safeArea:UILayoutGuide {
        get {
            return self.view.view.safeAreaLayoutGuide
        }
    }
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func loadFor(view:Shared.View) {
        self.view = view
        self.loadView()
        self.loadText()
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
