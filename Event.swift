import Foundation

class Event{
    static var EventList = [String: Event]()
    var uuid: String;
    var date: String;
    var person: String = "";
    var completed: Bool;
    
    init(date: String, completed: Bool) {
        self.uuid = UUID().uuidString;
        self.date = date;
        self.completed = completed;
        Event.EventList.updateValue(self, forKey: uuid);
    }
    
    func bookEvent(person: Person){
        self.person = person.uuid;
    }
    
    func showEvent() {
        print("\r\nID: \(self.uuid) \r\nDate: \(self.date)  \r\nPerson:  \(self.person) \r\nCompleted: \(self.completed)")
    }
    
    static func showAvailableSlots(){
        for booking in Event.EventList.values{
            if(!booking.completed && booking.person == ""){
                booking.showEvent();
            }
        }
    }
}
