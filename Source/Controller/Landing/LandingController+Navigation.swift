import UIKit

extension LandingController {
    func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.add,
            target:self,
            action:#selector(self.selectorAdd(sender:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.edit,
            target:self,
            action:#selector(self.selectorEdit(sender:)))
        self.title = String.localizedLanding(key:"LandingController_title")
    }
}
