import Foundation

class User : Person {
    static var UserList = [String: User]();
    override init(name: String, email: String, password: String) {
        super.init(name: name, email: email, password: password);
        User.UserList.updateValue(self, forKey: self.uuid)
    }
}
