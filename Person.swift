import Foundation

class Person {
    static var PersonList = [String: Person]();
    static var IdEmailDict = [String: String]();
    static var currentPerson : Person!;
    var bookingHistory = [String]();
    var name,email, password, uuid, phone, address : String;
    var canLogin: Bool = true;
    init(name: String, email: String, password: String, phone: String, address: String) {
        self.uuid = UUID().uuidString;
        self.name = name;
        self.email = email;
        self.password = password;
        self.phone = phone;
        self.address = address;
        
        Person.PersonList.updateValue(self, forKey: uuid);
        Person.IdEmailDict.updateValue(uuid, forKey: email);
    }
    
    func showDetails(){
        print("\r\nUUID: \(self.uuid) \r\nName: \(self.name) \r\nEmail: \(self.email) \r\nPassword: *******************\r\n \r\nPhone: \(self.phone) \r\nAddress: \(self.address)")
    }
    
    func getPersonString() -> String {
        return ("\r\nUUID: \(self.uuid) \r\nName: \(self.name) \r\nEmail: \(self.email) \r\nPhone: \(self.phone) \r\nAddress: \(self.address)")
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
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isValidPhone(_ value: String) -> Bool {
//        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
//        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
//        return phoneTest.evaluate(with: value)
        
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: value);
    }
    
    func isCompliant() -> Bool {
        let today = NSDate().timeIntervalSince1970
        if(self.bookingHistory.count > 0){
            for var i in self.bookingHistory{
                if(today - Event.EventList[i]!.date < 259201){
                    print("this one is still active")
                    return true;
                }
            }
        }
        
        return false;
    }
}
