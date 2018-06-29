import Foundation

class Updater {
    private let arguments:[String]
    private let shell:Shell
    
    init() {
        self.shell = Shell()
        self.arguments = CommandLine.arguments
        print(self.shell.execute(input:Constants.Git.listTags))/*
        do {
            try update()
        } catch let error {
            print(error.localizedDescription)
        }*/
    }
    
    private func update() throws {
        let commits:String = try self.getCommits()
        let plist:[String:Any] = try self.getPlist()
        print(plist[Constants.Plist.versionKey])
    }
    
    private func getPlist() throws -> [String:Any] {
        let url:URL = URL(fileURLWithPath:Constants.Plist.location)
        let data:Data = try Data(contentsOf:url)
        let rawList:Any = try PropertyListSerialization.propertyList(from:data, options:
            PropertyListSerialization.ReadOptions(), format:nil)
        guard
            let list:[String:Any] = rawList as? [String:Any]
        else { throw ErrorUpdater.plistNotFound }
        return list
    }
    
    
    
    private func update(plist:[String:Any]) throws -> [String:Any] {
        return [:]
    }
    
    private func getCommits() throws -> String {
        let commitsString:String = self.shell.execute(input:Constants.Git.countCommits)
        guard
            commitsString.isEmpty == false,
            let commitsInt:Int = Int(commitsString),
            commitsInt > 0
            else { throw ErrorUpdater.commitsNotFound }
        return commitsString
    }
    
    private func getLastTag() throws -> String {
        let commitsString:String = self.shell.execute(input:Constants.Git.countCommits)
        guard
            commitsString.isEmpty == false,
            let commitsInt:Int = Int(commitsString),
            commitsInt > 0
            else { throw ErrorUpdater.commitsNotFound }
        return commitsString
    }
    
//    private func getVersionFrom
}
