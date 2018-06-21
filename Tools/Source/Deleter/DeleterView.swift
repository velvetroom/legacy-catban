import UIKit
import Shared

class DeleterView<Interactor:DeleterInteractorProtocol>:View
    <Interactor, DeleterPresenter<Interactor>, DeleterViewContent> {
    override func initProperties() {
        super.initProperties()
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureViewModel()
    }
    
    override func didAppear() {
        super.didAppear()
        self.animateOpen()
    }
    
    override func orientationChanged(size:CGSize) {
        super.orientationChanged(size:size)
        self.view.frame = CGRect(origin:CGPoint.zero, size:size)
    }
    
    @objc func selectorCancel(button:UIButton) {
        self.closeDeleter()
        self.presenter.cancel()
    }
    
    @objc func selectorConfirm(button:UIButton) {
        self.closeDeleter()
        self.presenter.confirm()
    }
    
    private func configureView() {
        self.content.background.button.addTarget(self, action:#selector(self.selectorCancel(button:)),
                                                 for:UIControlEvents.touchUpInside)
        self.content.viewMenu.buttonCancel.addTarget(self, action:#selector(self.selectorCancel(button:)),
                                                     for:UIControlEvents.touchUpInside)
        self.content.viewMenu.buttonConfirm.addTarget(self, action:#selector(self.selectorConfirm(button:)),
                                                      for:UIControlEvents.touchUpInside)
    }
    
    private func configureViewModel() {
        var viewModel:DeleterViewModel = self.viewModel.property()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:DeleterViewModel) {
        self.content.viewMenu.labelTitle.text = viewModel.title
        self.content.viewMenu.labelName.text = viewModel.name
    }
    
    private func animateOpen() {
        UIView.animate(withDuration:DeleterConstats.Shared.animation, animations: { [weak self] in
            self?.content.background.alpha = DeleterConstats.Background.alphaOn
        }) { [weak self] (done:Bool) in
            self?.animateShowMenu()
        }
    }
    
    private func animateShowMenu() {
        self.content.viewMenu.layoutBottom.constant = 0
        UIView.animate(withDuration:DeleterConstats.Shared.animation) { [weak self] in
            self?.content.layoutIfNeeded()
        }
    }
    
    private func closeDeleter() {
        self.content.viewMenu.layoutBottom.constant = DeleterConstats.Menu.height
        UIView.animate(withDuration:DeleterConstats.Shared.animation, animations: { [weak self] in
            self?.content.alpha = 0
            self?.content.layoutIfNeeded()
        }) { [weak self] (done:Bool) in
            self?.transition.dismiss()
        }
    }
}
