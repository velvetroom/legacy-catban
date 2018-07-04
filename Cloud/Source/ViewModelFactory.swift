import UIKit
import Architecture
import Board
import Shared

class ViewModelFactory {
    class func makeContentWith(project:ProjectProtocol) -> ViewModelContent {
        if project is ProjectSynchedProtocol {
            return makeCloud()
        } else {
            return makeNotClouded()
        }
    }
    
    class func makeProjectWith(project:ProjectProtocol) -> ViewModelProject {
        var property:ViewModelProject = ViewModelProject()
        property.projectName = project.name
        return property
    }
    
    class func makeNavigationWith(project:ProjectProtocol) -> ViewModelNavigation {
        var property:ViewModelNavigation = ViewModelNavigation()
        property.toolbarHidden = !(project is ProjectSynchedProtocol)
        return property
    }
    
    class func makeContentWith(error:Error) -> ViewModelContent {
        var viewModel:ViewModelContent = ViewModelContent()
        viewModel.buttonContinueHidden = false
        viewModel.buttonStartHidden = true
        viewModel.message = error.localizedDescription
        viewModel.icon = UIImage(name:ViewConstants.Icon.assetError, in:Cloud.View.self)
        return viewModel
    }
    
    class func makeContentSaved() -> ViewModelContent {
        var viewModel:ViewModelContent = ViewModelContent()
        viewModel.buttonContinueHidden = true
        viewModel.buttonStartHidden = true
        viewModel.message = String.localized(key:"ViewModelFactory_LabelSaved", in:View.self)
        viewModel.icon = UIImage(name:ViewConstants.Icon.assetUpToDate, in:Cloud.View.self)
        return viewModel
    }
    
    class func makeNavigationWith(error:Error) -> ViewModelNavigation {
        var property:ViewModelNavigation = ViewModelNavigation()
        property.toolbarHidden = true
        return property
    }
    
    private class func makeNotClouded() -> ViewModelContent {
        var property:ViewModelContent = ViewModelContent()
        property.buttonStartHidden = false
        property.message = String.localized(key:"ViewModelFactory_LabelNotClouded", in:View.self)
        property.icon = UIImage(name:ViewConstants.Icon.assetNotClouded, in:Cloud.View.self)
        return property
    }
    
    private class func makeCloud() -> ViewModelContent {
        var property:ViewModelContent = ViewModelContent()
        property.buttonContinueHidden = true
        property.buttonStartHidden = true
        property.message = String.localized(key:"ViewModelFactory_LabelCloud", in:Cloud.View.self)
        property.icon = UIImage(name:ViewConstants.Icon.assetCloud, in:Cloud.View.self)
        return property
    }
    
    private init() { }
}
