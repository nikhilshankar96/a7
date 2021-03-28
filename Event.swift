import Foundation

class Event{
    static var EventList = [String: Event]()
    var uuid: String;
    var date: Double;
    var person: String = "";
    var completed: Bool;
    
    init(date: Double, completed: Bool) {
        self.uuid = UUID().uuidString;
        self.date = date;
        self.completed = completed;
        Event.EventList.updateValue(self, forKey: uuid);
    }
    
    func getProperDate() -> String {
        let date = Date(timeIntervalSince1970: self.date)

          let dateFormatter = DateFormatter()
          dateFormatter.locale = Locale(identifier: "en_US")
          dateFormatter.dateStyle = .medium

          return dateFormatter.string(from: date)
      }
    
    func bookEvent(person: Person){
        self.person = person.uuid;
        person.bookingHistory.append(self.uuid);
        print("event booked: \(self.getProperDate()) -> \(person.name)")
    }
    
    func showEvent() {
        print("\r\nID: \(self.uuid) \r\nDate: \(self.getProperDate())  \r\nPerson:  \(self.person) \r\nCompleted: \(self.completed)")
    }
    func getEventString() -> String{
        return("\r\nID: \(self.uuid) \r\nDate: \(self.getProperDate())  \r\nPerson:  \(Person.PersonList[self.person]?.name ?? "")  \r\nCompleted: \(self.completed)")
    }
    
    static func showAvailableSlots(){
        for booking in Event.EventList.values{
            if(!booking.completed && booking.person == ""){
                booking.showEvent();
            }
        }
    }
}
