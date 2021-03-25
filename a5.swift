

class Doctor : Person {
    static var DoctorList = [String :Doctor]();
    var availableSlots: [String: String];
    init(name: String, email: String, password: String, availableSlots: [String: String]) {
        self.availableSlots = availableSlots;
        super.init(name: name, email: email, password: password);
        Doctor.DoctorList.updateValue(self, forKey: self.uuid)
    }
    
    static func showAllDocAppointments(){
        for dr in DoctorList.values {
            if dr.canLogin{
                dr.showDetails();
                print("Appointments: ");
                dr.showAllAppointments();
                print("\n");
            }
        }
    }
    
    func addAppointment(date: String) {
        self.availableSlots.updateValue("", forKey: date);
    }
    
    func showAllAppointments(){
        var i: Int = 1;
        self.availableSlots.forEach { print(i," \($0): \($1)"); i+=1; }
    }
    
    func bookAppointment(date: String, patient: String) {
        if self.availableSlots[date] == nil || self.availableSlots[date] == "" {
            self.availableSlots.updateValue(patient, forKey: date);
            print("Appointment booked for user: "+patient+" at "+date);
        }
    }
    
    func deleteDoctor(id: String){
        Doctor.DoctorList[id]?.canLogin = false;
    }
}
