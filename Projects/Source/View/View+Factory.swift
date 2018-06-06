import UIKit

extension View {
    class func makeToolbarItems() -> [UIBarButtonItem] {
        return [makeButtonDelete(),
                makeFixedSpace(),
                makeButtonRename(),
                makeFlexibleSpace(),
                makeButtonOpen()]
    }
    
    private class func makeButtonDelete() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.trash, target:self, action:
            #selector(self.selectorDelete(button:)))
    }
    
    private class func makeButtonRename() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.compose, target:self, action:
            #selector(self.selectorRename(button:)))
    }
    
    private class func makeButtonOpen() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.play, target:self, action:
            #selector(self.selectorOpen(button:)))
    }
    
    private class func makeFixedSpace() -> UIBarButtonItem {
        let space:UIBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.fixedSpace, target:nil, action:nil)
        space.width = ViewConstants.Toolbar.fixedSpace
        return space
    }
    
    private class func makeFlexibleSpace() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
    }
}
