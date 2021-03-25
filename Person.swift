import Foundation

class Person {
    static var PersonList = [String: Person]();
    static var IdEmailDict = [String: String]();
    static var currentPerson : Person!;
    var bookingHistory = [Event]();
    var name,email, password, uuid : String;
    var canLogin: Bool = true;
    init(name: String, email: String, password: String) {
        self.uuid = UUID().uuidString;
        self.name = name;
        self.email = email;
        self.password = password;
        Person.PersonList.updateValue(self, forKey: uuid);
        Person.IdEmailDict.updateValue(uuid, forKey: email);
    }
    
    func showDetails(){
        print("\r\nUUID: \(self.uuid) \r\nName: \(self.name) \r\nEmail: \(self.email) \r\nPassword: *******************\r\n")
    }
    
    func getDetailsString() -> String {
        return "\r\nUUID: \(self.uuid) \r\nName: \(self.name) \r\nEmail: \(self.email) \r\nPassword: *******************\r\n"
    }
    
    func updateUser(name: String, email: String){
        self.email = email;
        self.name = name;
    }
    
    static func deleteThis(uuid: String){
        if(  PersonList[uuid] !== nil){
            PersonList[uuid]?.canLogin = false;
            print("\(  PersonList[uuid]?.name ?? uuid) has been deleted!")
        } else {
            print("No user found with that ID, try again!")
        }
    }
    
    func setCurrentPerson(person: Person) {
        Person.currentPerson = person;
    }
    
    func getCurrentUser() -> Person {
        return Person.currentPerson!
    }
    
    func getSearchString() -> String {
        return String(self.name + " " + self.email )
    }
}
