import UIKit
class AddSupScreen: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var quantityField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.title = "Add Supplier"

        
        nameField.autocapitalizationType = .words;
        nameField.autocorrectionType = .no;
        emailField.autocorrectionType = .no;
        
    }
    
    @IBAction func addButtonHit(_ sender: Any){
        if(nameField.text != "" &&
            passwordField.text != "" &&
            Person.isValidEmail(emailField.text!) &&
            Person.isValidPhone(phoneField.text!) &&
            quantityField.text != "" &&
            Int(quantityField.text!) != nil){
            let s = Supplier(name: nameField.text!, email: emailField.text!, password: passwordField.text!, quantity: Int(quantityField.text!)!, phone: phoneField.text!, address: addressField.text!);
            s.showDetails();
            self.navigationController?.popViewController(animated: true)
        }
        else{
            print("error");
            let a4 = UIAlertController(title: "Error", message: "Invalid input!", preferredStyle: .alert)

            // add an action (button)
            a4.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(a4, animated: true, completion: nil)
        }
    }
}
