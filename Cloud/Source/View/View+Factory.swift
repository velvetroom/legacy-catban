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
                               action:#selector(self.selectorSave(button:)))
    }
    
    private func makeButtonShare() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.action, target:nil, action:nil)
    }
    
    private func makeSeparator() -> UIBarButtonItem {
        let separator:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fixedSpace,
                                                        target:nil, action:nil)
        separator.width = ViewConstants.Toolbar.fixedSpace
        return separator
    }
    
    private func makeFlexibleSpace() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
    }
}
