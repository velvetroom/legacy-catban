import UIKit

extension View {
    func makeToolbarItems() -> [UIBarButtonItem] {
        let flexibleSpace:UIBarButtonItem = self.makeFlexibleSpace()
        return [flexibleSpace,
                self.makeButtonUpload(),
                flexibleSpace,
                self.makeButtonShare(),
                flexibleSpace]
    }
    
    private func makeButtonUpload() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.save, target:nil, action:nil)
    }
    
    private func makeButtonShare() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.action, target:nil, action:nil)
    }
    
    private func makeFlexibleSpace() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
    }
}
