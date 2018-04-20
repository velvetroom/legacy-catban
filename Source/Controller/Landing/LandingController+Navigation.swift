import UIKit

extension LandingController {
    func adjustNavigationItem() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.add,
            target:self,action:#selector(self.selectorAdd(sender:))),UIBarButtonItem(title:"Stats", style:UIBarButtonItemStyle.plain, target:self, action:#selector(self.selectorOrganise(sender:)))]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem:UIBarButtonSystemItem.organize,
            target:self,
            action:#selector(self.selectorOrganise(sender:)))
        self.title = String.localizedLanding(key:"LandingController_title")
    }
}
