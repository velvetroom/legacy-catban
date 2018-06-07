import UIKit
import Shared

class PresenterOutletsLoader {
    weak var view:Shared.View!
    weak var presenter:Presenter!
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
        self.loadPresenterForKeyboard()
        return self.outlets
    }
    
    private func loadView() {
        self.outlets.view = self.view
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
    
    private func loadPresenterForKeyboard() {
        self.presenter.presenterForKeyboard.layoutBottom = self.outlets.viewText?.layoutBottom
        self.presenter.presenterForKeyboard.viewContainer = self.outlets.view?.view
        self.presenter.presenterForKeyboard.startListening()
    }
}
