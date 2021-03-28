import UIKit

class PassableUIButton: UIButton{
    var params: Dictionary<String, Any>
    override init(frame: CGRect) {
        self.params = [:]
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        self.params = [:]
        super.init(coder: aDecoder)
    }
}

class EventBookingScreen: UIViewController {
    
    func bookEvent(id: String){
        Event.EventList[id]?.bookEvent(person: Person.currentPerson);
        print("inside book fn")
    }
    
    @objc func bookButtonAction(sender: PassableUIButton!) {
        
//        print(sender.params["uuid"]!);
        if(sender.params["uuid"] != nil){
            bookEvent(id: sender.params["uuid"]! as! String);
            self.navigationController?.popViewController(animated: true)
        }
        else {
            print("error in button press");
            print(sender.params["uuid"]!);
            let a12 = UIAlertController(title: "Error", message: "Invalid input!", preferredStyle: .alert)
            // add an action (button)
            a12.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(a12, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        /// Button thing
        var buttonY: CGFloat = 200  // our Starting Offset, could be 0
        for e in Event.EventList.values {
            if(e.person != ""){
                continue;
            }
            let eButton = PassableUIButton(frame: CGRect(x: 50, y: buttonY, width: 250, height: 30))
            buttonY = buttonY + 50  // we are going to space these UIButtons 50px apart
                    
            eButton.layer.cornerRadius = 10  // get some fancy pantsy rounding
            eButton.backgroundColor = UIColor.darkGray
            eButton.setTitle(e.getProperDate(), for: .normal) // We are going to use the item name as the Button Title here.
            eButton.params["uuid"] = e.uuid ;
            eButton.addTarget(self, action: #selector(bookButtonAction), for: .touchUpInside)
                    
            self.view.addSubview(eButton)
        
        ///Button thing end
    }
        
    }
}
