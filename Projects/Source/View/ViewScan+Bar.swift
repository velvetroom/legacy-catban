import UIKit

extension ViewScan {
    func makeBarActions() {
        let space:UIBarButtonItem = self.makeFlexibleSpace()
        self.content.viewBar.setItems([self.makeClose(), space], animated:false)
    }
    
    private func makeClose() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.stop, target:self,
                               action:#selector(self.selectorClose))
    }
    
    private func makeFlexibleSpace() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace,
                               target:nil, action:nil)
    }
}
