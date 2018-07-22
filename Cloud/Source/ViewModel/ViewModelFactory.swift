import UIKit
import Architecture
import Board
import Shared

class ViewModelFactory {
    class func makeContentWith(project:ProjectProtocol) -> ViewModelContent {
        if let project:ProjectSynchedProtocol = project as? ProjectSynchedProtocol {
            return makeCloudWithProject(project:project)
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
        viewModel.icon = UIImage(name:Constants.Icon.assetError, in:Cloud.View.self)
        return viewModel
    }
    
    class func makeContentSavedWith(project:ProjectSynchedProtocol) -> ViewModelContent {
        var viewModel:ViewModelContent = makeLastSavedWith(project:project)
        viewModel.icon = UIImage(name:Constants.Icon.assetUpToDate, in:Cloud.View.self)
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
        property.icon = UIImage(name:Constants.Icon.assetNotClouded, in:Cloud.View.self)
        return property
    }
    
    private class func makeCloudWithProject(project:ProjectSynchedProtocol) -> ViewModelContent {
        var viewModel:ViewModelContent = makeLastSavedWith(project:project)
        viewModel.icon = UIImage(name:Constants.Icon.assetCloud, in:Cloud.View.self)
        return viewModel
    }
    
    private class func makeLastSavedWith(project:ProjectSynchedProtocol) -> ViewModelContent {
        var message:String = String.localized(key:"ViewModelFactory_LabelSaved", in:Cloud.View.self)
        message += dateFrom(timestamp:project.uploaded)
        var property:ViewModelContent = ViewModelContent()
        property.buttonContinueHidden = true
        property.buttonStartHidden = true
        property.message = message
        return property
    }
    
    private class func dateFrom(timestamp:Int) -> String {
        let date:Date = Date(timeIntervalSince1970:TimeInterval(timestamp))
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        return dateFormatter.string(from:date)
    }
    
    private init() { }
}
