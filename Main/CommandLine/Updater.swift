import Foundation

class Updater {
    let arguments:[String]
    
    init() {
        self.arguments = CommandLine.arguments
        do {
            try update()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func update() throws {
        let commits:String = try self.getCommits()
        var plist:[String:Any] = try self.getPlist()
        print(plist[Constants.versionKey])
    }
    
    private func getCommits() throws -> String {
        guard
            self.arguments.count > 1
        else { throw ErrorUpdater.commitsNotFound }
        return self.arguments[1]
    }
    
    private func getPlist() throws -> [String:Any] {
        let url:URL = URL(fileURLWithPath:Constants.plist)
        let data:Data = try Data(contentsOf:url)
        let rawList:Any = try PropertyListSerialization.propertyList(from:data, options:
            PropertyListSerialization.ReadOptions(), format:nil)
        guard
            let list:[String:Any] = rawList as? [String:Any]
        else { throw ErrorUpdater.plistNotFound }
        return list
    }
}
