import UIKit

extension View {
    func makeToolbarItems() -> [UIBarButtonItem] {
        return [makeButtonDelete(),
                makeFixedSpace(),
                makeButtonRename(),
                makeFlexibleSpace(),
                makeButtonOpen()]
    }
    
    private func makeButtonDelete() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.trash, target:self, action:
            #selector(self.selectorDelete(button:)))
    }
    
    private func makeButtonRename() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.compose, target:self, action:
            #selector(self.selectorRename(button:)))
    }
    
    private func makeButtonOpen() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.play, target:self, action:
            #selector(self.selectorOpen(button:)))
    }
    
    private func makeFixedSpace() -> UIBarButtonItem {
        let space:UIBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.fixedSpace, target:nil, action:nil)
        space.width = ViewConstants.Toolbar.fixedSpace
        return space
    }
    
    private func makeFlexibleSpace() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
    }
}
