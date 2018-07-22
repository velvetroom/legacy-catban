import UIKit

extension View {
    func makeToolbarItems() -> [UIBarButtonItem] {
        let flexibleSpace:UIBarButtonItem = self.makeFlexibleSpace()
        return [flexibleSpace,
                self.makeButtonSave(),
                self.makeSeparator(),
                self.makeButtonShare(),
                flexibleSpace]
    }
    
    private func makeButtonSave() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.save, target:self,
                               action:#selector(self.selectorSave))
    }
    
    private func makeButtonShare() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.action, target:self,
                               action:#selector(self.selectorShare))
    }
    
    private func makeSeparator() -> UIBarButtonItem {
        let separator:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fixedSpace,
                                                        target:nil, action:nil)
        separator.width = Constants.Toolbar.fixedSpace
        return separator
    }
    
    private func makeFlexibleSpace() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
    }
}
