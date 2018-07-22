import UIKit
import Shared

extension View {
    func makeActions() {
        self.navigationItem.rightBarButtonItems = [self.makeAdd(), self.makeScan()]
    }
    
    private func makeAdd() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.add, target:self,
                               action:#selector(self.selectorAddProject))
    }
    
    private func makeScan() -> UIBarButtonItem {
        let image:UIImage = UIImage(name:ViewConstants.Actions.assetQr, in:type(of:self))
        return UIBarButtonItem(image:image, style:UIBarButtonItemStyle.plain, target:self,
                               action:#selector(self.selectorScan))
    }
}
