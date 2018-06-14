import UIKit
import Shared

class DeleterView<Interactor:DeleterInteractorProtocol>:View
<Interactor, DeleterPresenter<Interactor>, DeleterViewModel, DeleterViewContent> {
    
}
