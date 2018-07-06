import UIKit
import Shared

extension View {
    func makeActions() {
        self.navigationItem.rightBarButtonItems = [self.makeAdd(), self.makeScan(), self.makeImage()]
    }
    
    private func makeAdd() -> UIBarButtonItem {
        return UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.add,
            target:self, action:#selector(self.selectorAddProject))
    }
    
    private func makeScan() -> UIBarButtonItem {
        return UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.camera,
            target:self, action:#selector(self.selectorAddProject))
    }
    
    private func makeImage() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Actions.assetQr, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:nil, action:nil)
    }
}
