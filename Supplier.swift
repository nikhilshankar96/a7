import Foundation

class Supplier : Person {
    static var SupplierList = [String :Supplier]();
    var quantity: Int;
    init(name: String, email: String, password: String, quantity: Int) {
        self.quantity = quantity;
        super.init(name: name, email: email, password: password);
        Supplier.SupplierList.updateValue(self, forKey: self.uuid)
    }
    
    override func showDetails() {
        print("\r\nUUID: \(self.uuid) \r\nName: \(self.name) \r\nEmail: \(self.email) \r\nQuantity: \(self.quantity)\r\n")
    }
    
    
    static func getAllQuantity() -> [Int]{
        var quantArray = [Int]();
        for sup in SupplierList{
            quantArray.append(sup.value.quantity);
        }
        return quantArray;
    }
    
    static func viewAllSupplier(){
        for sup in SupplierList{
            sup.value.showDetails()
        }
    }

  
    func deleteSupplier(id: String){
        Supplier.SupplierList[id]?.canLogin = false;
    }
}
