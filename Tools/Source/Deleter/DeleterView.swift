import UIKit
import Shared

class DeleterView<Interactor:DeleterInteractorProtocol>:View
    <Interactor, DeleterPresenter<Interactor>, DeleterViewContent> {
    override func initProperties() {
        super.initProperties()
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
}
