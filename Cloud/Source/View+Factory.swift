import UIKit

extension View {
    func makeToolbarItems() -> [UIBarButtonItem] {
        let flexibleSpace:UIBarButtonItem = self.makeFlexibleSpace()
        return [flexibleSpace,
                self.makeButtonUpload(),
                self.makeSeparator(),
                self.makeButtonShare(),
                flexibleSpace]
    }
    
    private func makeButtonUpload() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.save, target:nil, action:nil)
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
