//import Foundation;
//
//func quitApp(){
//    print("Quiting...");
//    return;
//}
//
//func Screen1(){
//    print("""
//
//    Welcome! Select an option:
//
//    1. Login
//    2. Register
//
//    0: Quit
//
//    """);
//
//    let n = readLine();
//
//    switch n {
//        case "0":
//            quitApp();
//            break;
//
//        case "1":
//            LoginScreen();
//            break;
//
//        case "2":
//            AddPersonScreen();
//            break;
//
//        default:
//            print("Invalid input");
//            Screen1();
//            break;
//        }
//    return;
//};
//
//func LoginScreen(){
//    print("""
//
//    Login:
//
//    Enter email address:
//
//    """);
//    guard let e = readLine() else { return };
//    if Person.IdEmailDict[e] != nil {
//        print("""
//
//        Login:
//
//        Enter password:
//
//        """);
//        guard let p = readLine() else { return };
//        let id = Person.IdEmailDict[e];
//        print(id!)
////        Person.PersonList[String(id!)]
//        if p == Person.PersonList[String(id!)]?.password {
//            print("Logged in!");
//            Person.currentPerson = Person.PersonList[String(id!)] ?? admin
//            MainScreen1();
//            return;
//        } else {
//            print("Wrong password!");
//            LoginScreen();
//            return;
//        }
//    } else {
//        print("No such Person exists!");
//        Screen1();
//        return;
//    }
//
//}
//
//func MainScreen1(){
//    print("""
//
//    Main menu:
//
//    1. Account
//    2. Suppliers
//    3. Bookings
//
//
//    0. Logout
//
//    """);
//
//    let n = readLine();
//    switch n {
//    case "1":
//        AccountScreen1();
//        return;
//
//    case "2":
//        SupplierScreen1();
//        return;
//
//    case "3":
//        BookingScreen1();
//        return;
//
//    case "0":
//        quitApp();
//        return;
//
//    default:
//        print("Invalid input!");
//        MainScreen1();
//        return;
//    }
//}
//
//func AccountScreen1(){
//    print("""
//    Account menu:
//
//    1. View   – Select to display account details
//    2. Update – Select to update name and email
//    9. Delete – Enter UUID to delete account
//
//
//    0. Logout
//
//    """);
//    let n = readLine();
//
//    switch n {
//    case "1":
//        Person.currentPerson?.showDetails();
//        MainScreen1();
//        return;
//
//    case "2":
//        PersonUpdateScreen();
//        return;
//
//    case "9":
//        print("Enter UUID to delete Person:")
//        let u = readLine()!;
//        if Person.PersonList[u] != nil {
//            print("Do you want to delete Person: ", Person.PersonList[u]?.name as Any);
//            print("""
//            Do you want to delete Person: \(Person.PersonList[u]?.name as Any)?
//            (Type 'y' to confirm)
//            """)
//            let conf = readLine();
//            if(conf == "y"){
//                Person.deleteThis(uuid: u);
//                LoginScreen();
//            }
//            else{
//                print("Confirmation rejected, Person not deleted!");
//                return;
//            }
//        } else {
//            print("Person not found!");
//            AccountScreen1();
//            return;
//        }
//
//        MainScreen1();
//        return;
//
//    case "0":
//        quitApp();
//        return;
//
//    default:
//        print("Invalid input");
//        AccountScreen1();
//        return;
//    }
//
//    return;
//}
//
//func PersonUpdateScreen(){
//    print("Enter Personname to update (enter 'q' to skip): ");
//    let u = readLine();
//    if u == "q" {
//        print("");
//    } else {
//        Person.currentPerson?.name = u!;
//    }
//    print("Enter email to update (enter 'q' to skip): ");
//    let e = readLine();
//
//    if e == "q" {
//        print("");
//    } else {
//        Person.currentPerson?.email = e!;
//    }
//    MainScreen1();
//    return;
//}
//
//func SupplierScreen1(){
//    print("""
//    Supplier menu:
//
//    1. View – Select to display all Suppliers list
//    2. Update – Select to update a Supplier
//    3. Add – Select to add a new Supplier
//    9. Delete – Select and enter UUID to delete Supplier
//
//    0. Back
//
//    """);
//
//    let n = readLine();
//
//    switch n{
//
//    case "0":
//        MainScreen1();
//        return;
//
//    case "1":
//        Supplier.viewAllSupplier();
//        SupplierScreen1();
//        return;
//
//    case "2":
//        print("Enter UUID to select Supplier to update (enter 'q' to skip): ");
//        let d = readLine();
//        if(d == "q"){
//            SupplierScreen1();
//        } else {
//            if Supplier.SupplierList[d!] != nil{
//                let doc : Supplier = Supplier.SupplierList[d!]!;
//                print("Enter Personname to update (enter 'q' to skip): ");
//                let u = readLine();
//                if u == "q" {
//                    print("");
//                } else {
//                    doc.name = u!;
//                }
//                print("Enter email to update (enter 'q' to skip): ");
//                let e = readLine();
//
//                if e == "q" {
//                    print("");
//                } else {
//                    doc.email = e!;
//                }
//                SupplierScreen1();
//                return;
//
//            } else{
//                print("Invalid Id, try again!")
//                SupplierScreen1();
//            }
//        }
//        return;
//
//    case "9":
//        print("Enter UUID to delete Person:")
//        let u = readLine()!;
//        if Person.PersonList[u] != nil {
//            print("Do you want to delete Person: ", Person.PersonList[u]?.name as Any);
//            print("""
//            Do you want to delete Person: \(Person.PersonList[u]?.name as Any)?
//            (Type 'y' to confirm)
//            """)
//            let conf = readLine();
//            if(conf == "y"){
//                Person.deleteThis(uuid: u);
//                LoginScreen();
//            }
//            else{
//                print("Confirmation rejected, Person not deleted!");
//                return;
//            }
//        } else {
//            print("Person not found!");
//            AccountScreen1();
//            return;
//        }
//
//        SupplierScreen1();
//        return;
//
//    case "3":
//        AddSupplierScreen1();
//        break;
//
//    default:
//        print("Invalid input!");
//        SupplierScreen1();
//        break;
//    }
//
//    return;
//}
//
//func AddSupplierScreen1(){
//    print("""
//
//    Add Supplier menu:
//
//    Enter new Supplier name:
//    """);
//    guard let name = readLine() else{
//        print("Invalid input!")
//        AddSupplierScreen1();
//        return;
//    }
//
//    print("""
//
//    Add Supplier menu:
//
//    Enter new Supplier email:
//    """);
//    guard let email = readLine() else{
//        print("Invalid input!")
//        AddSupplierScreen1();return;
//    }
//
//    print("""
//
//    Add Supplier menu:
//
//    Enter new Supplier quantity:
//    """);
//    guard let quantity = readLine() else{
//        print("Invalid input!")
//        AddSupplierScreen1();return;
//    }
//
//    print("""
//
//    Add Supplier menu:
//
//    Enter new Supplier password:
//    """);
//    guard let pass = readLine() else{
//        print("Invalid input!")
//        AddSupplierScreen1();return;
//    }
//
//    let _ : Supplier = Supplier(name: name, email: email, password: pass, quantity:  Int(quantity) ?? 0)
//
//
//    print("Added Supplier!");
//    SupplierScreen1();
//    return;
//}
//
////
//func BookingScreen1(){
//    print("""
//    Schedule menu:
//
//    1. Show all appointments and book one
//    2. History
//    3. Status
//
//    0. Logout
//
//    """);
//
//    let n : String = readLine() ?? "99";
//
//    switch n {
//    case "0":
//        quitApp();
//        return;
//    case "1":
//        BookingScreenMain();
//        return;
//
//    case "3":
//        Person.currentPerson?.showDetails()
//        BookingScreen1()
//        return;
//
//    case "2":
//        print("\(String(describing: Person.currentPerson?.bookingHistory))")
//        BookingScreen1()
//        return;
//
//
//    default:
//        print("Invalid input!");
//        BookingScreen1();
//        return;
//    }
//    return;
//}
//
//func BookingScreenMain(){
//    Event.showAvailableSlots();
//    print("""
//    Schedule menu:
//
//    1. Make a booking
//
//    4. Previous Menu
//
//    q. Quit
//
//    """);
//    let n = readLine() ?? "q";
//        if n == "q" || n == ""{
//            BookingScreen1();
//            return;
//        }
//
//    switch n {
//    case "q":
//        quitApp();
//        return;
//
//    case "1":
//        BookingScreen();
//        return;
//
//
//    case "4":
//        BookingScreen1();
//        return;
//
//    default:
//        print("Invalid input!");
//        BookingScreenMain();
//        return;
//    }
//    return;
//}
//
//func BookingScreen(){
//    print("""
//    Schedule menu:
//
//    Enter slot id to make a booking:
//
//    9. Cancel
//
//    """);
//    let n = readLine() ?? "q";
//    if n == "9" || n == ""{
//        BookingScreen1();
//        return;
//    }
//    if(Event.EventList[n] != nil){
//
//
//        Event.EventList[n]?.person = Person.currentPerson.uuid;
//            Person.currentPerson?.bookingHistory.append(Event.EventList[n]!)
//            print("Booking done!\n");
//            BookingScreen1();
//
//    }
//    else {
//        print("invalid input!");
//        BookingScreenMain();
//    }
//
//}
//
//func AddPersonScreen(){
//    print("""
//
//    Register:
//
//    Enter name:
//    """);
//    guard let name = readLine() else{
//        print("Invalid input!")
//        AddPersonScreen();
//        return;
//    }
//
//    print("""
//
//    Add Supplier menu:
//
//    Enter email:
//    """);
//    guard let email = readLine() else{
//        print("Invalid input!")
//        AddSupplierScreen1();return;
//    }
//    if Person.IdEmailDict[email] != nil {
//        print("Person already exits!");
//        AddPersonScreen();
//        return;
//    }
//
//    print("""
//
//    Add Supplier menu:
//
//    Enter password:
//    """);
//    guard let pass = readLine() else{
//        print("Invalid input!")
//        AddPersonScreen();return;
//    }
//    let p1 : Person = Person(name: name, email: email, password: pass)
//    Person.currentPerson = p1;
//
//    print("Added Person!\n");
//    MainScreen1();
//    return;
//}
//
//
//func Main(){
//    // Start
//    Screen1();
//}
//
////let admin = Person(name: "Admin", email: "admin", password: "admin");
////let Person1 = Person(name: "N", email: "nnn", password: "admin");
////let doc1 = Supplier(name: "Ray", email: "ray", password: "admin", quantity: 6)
////let doc2 = Supplier(name: "Norman", email: "norman", password: "admin", quantity: 5)
////Person.currentPerson = admin;
////
////let e1 = Event(date: "2/22/2020", completed: false);
////let e2 = Event(date: "2/23/2020", completed: false);
////let e3 = Event(date: "2/24/2020", completed: false);
////let e4 = Event(date: "2/25/2020", completed: false);
////let e5 = Event(date: "2/26/2020", completed: false);
////let e6 = Event(date: "2/27/2020", completed: false);
////let e7 = Event(date: "3/1/2020", completed: false);
////
////Main();
//
