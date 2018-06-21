import UIKit
import Shared

public class View:Shared.View<Interactor, Presenter, ViewContent> {
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureViewModel()
    }
    
    private func configureView() {
        self.title = String.localized(key:"View_title", in:type(of:self))
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelContent = ViewModelContent()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelContent) {
        self.content.labelName.text = viewModel.name
    }
    
    private func connectOutlets() {
//        self.viewScroll.viewBase?.viewBar.deleteButton.addTarget(
//            self, action:#selector(self.selectorDelete(button:)), for:UIControlEvents.touchUpInside)
//        self.viewScroll.viewBase?.viewInput.doneButton.addTarget(
//            self, action:#selector(self.selectorDone(button:)), for:UIControlEvents.touchUpInside)
//        self.viewScroll.viewBase?.viewInput.field.delegate = self
    }
    
    @objc func selectorDelete(button:UIButton) {
//        self.presenter?.delete()
    }
    
    @objc func selectorDone(button:UIButton) {
//        self.presenter?.done()
    }
}
