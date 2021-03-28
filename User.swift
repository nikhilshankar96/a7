import Foundation

class User : Person {
    static var UserList = [String: User]();
    override init(name: String, email: String, password: String, phone: String, address: String) {
        super.init(name: name, email: email, password: password, phone: phone, address: address);
        User.UserList.updateValue(self, forKey: self.uuid)
    }
}
