
// OUR FUNCTIONS
// ==================================================================

func isAdmin(){
  
}
func Convert(Amount: Double, from baseCur: String, to targetCur:String, and RatesDict:[String:Double]) -> Double{
  let convertKey = "\(baseCur)-\(targetCur)"
  let result = Amount * RatesDict[convertKey, default: 0.0]

  if(baseCur == targetCur){
    return 0.0
  }
  return result
}


func tinySpace(){
  print("\n")
}
func mediumDrawLine(){
  print("_________________________")
}
func bigDrwaLine(){
  print("_____________________________________________________")
}
func title(){
  print(" ============================================")
  print("|    CURRENCY CONVERTER APPLICATION CCA      |")
  print(" ============================================")
}


func menu(start currencyArray:[String]){
  print("\tMENU : Devises")
  mediumDrawLine()
  // let exchangeCurrency = [
  //   "XOF", "EUR", "USD", "LIVRE", "YEN",
  // ]
  for i in 1...currencyArray.count{
      print("\t \(i) --> \(currencyArray[i-1])")
  }
}

// MAIN PROGRAM
// =================================================

title()
tinySpace()

var keepOnWholeProgram = false
var testAmount = true
var currencies = [
  "XOF", "EUR", "USD", "LIVRE", "YEN",
]

var permanentBCur = "";
var permanentTCur = "";

var exchangeRates = [
  "USD-EUR":  0.93, 
  "USD-LIVRE":  0.80, 
  "USD-XOF":  611.42,
  "USD-YEN":  150.05, 

  "EUR-USD":  1.07, 
  "EUR-LIVRE":  0.86, 
  "EUR-YEN":  1.07, 
  "EUR-XOF":  656.39, 

  "LIVRE-USD":  1.25,
  "LIVRE-EUR":  1.17,
  "LIVRE-YEN":  188.26,
  "LIVRE-XOF":  767.24,

  "YEN-USD":  0.0067,
  "YEN-EUR":  0.0062,
  "YEN-LIVRE":  0.0053,
  "YEN-XOF":  4.07,

  "XOF-USD":  0.0016,
  "XOF-EUR":  0.0015,
  "XOF-LIVRE":  0.0013,
  "XOF-YEN":  0.25
]


repeat{
  print("Entrer votre role (admin | client): ")
  var userRole = readLine()
 
  if(userRole?.lowercased() == "admin"){
    print("Entrer le taux de change : ")
    let newValueString = readLine()
    print("Devise de base : ")
    let BCur = readLine()
    let TCur = readLine()
    let newValue = Double(newValueString!)!
    var exchangeRatesKey:String;
    exchangeRatesKey = "\(BCur!)-\(TCur!)"
    
    exchangeRates.updateValue(newValue, forKey: exchangeRatesKey)
    currencies.append(BCur!)
    currencies.append(TCur!)
    permanentBCur = BCur!
    permanentTCur = TCur!
    // Affichage du menu

    menu(start: currencies)
    tinySpace()
  }

  print("Entrer votre role (Admin | Client): ")
  userRole = readLine()
  
  if(userRole?.lowercased() == "client"){
    print("Bonjour cher client")
    menu(start: currencies)
    tinySpace()
  }
  
    print("Selectionner la devise de base (1 pour XOF) :")
    var baseCurrency = "XOF"; var targetCurrency = "XOF"; let userBaseCurrency = readLine()
      switch (userBaseCurrency)  {
        case "1":
          baseCurrency = "XOF" 
          break;
        case "2":
          baseCurrency = "EUR" 
          break;
        case "3":
          baseCurrency = "USD" 
          break;
        case "4":
          baseCurrency = "LIVRE" 
          break;
        case "5":
          baseCurrency = "YEN" 
        case "6":
          baseCurrency = permanentBCur 
          break;
        case "7":
          baseCurrency = permanentTCur
          break;
        default:
         print("Le service selectionné est indisponible, Veuillez réessayer")
      }



      print("Selectionner la devise cible (1 pour XOF):")
      let userTargetCurrency = readLine()

      switch (userTargetCurrency)  {
        case "1":
          targetCurrency = "XOF" 
          break;
        case "2":
          targetCurrency = "EUR" 
          break;
        case "3":
          targetCurrency = "USD" 
          break;
        case "4":
          targetCurrency = "LIVRE" 
          break;
        case "5":
          targetCurrency = "YEN" 
          break;
        case "6":
          targetCurrency = permanentTCur 
          break;
        case "7":
          targetCurrency = permanentTCur 
          break;
        default:
          print("Le service selectionné est indisponible, Veuillez réessayer")
      }


      print("Entrer le montant à convertir dans la devise de base:")
      let amount = Double(readLine()!)!

      if(amount <= 0){
        print("Le montant invalide")
        testAmount = false
        break
      }


    tinySpace()
    print("_____________________________________________________")
    print("Vos différentes selections")
    print("_____________________________________________________ ")
    tinySpace()
    print("Devise de base : \(baseCurrency) & Devise cible : \(targetCurrency)")
    print("Type de conversion: \(baseCurrency) --> \(targetCurrency)")
    print("Montant à convertir : \(amount) \(baseCurrency)")


    // let _convertKey = "\(baseCurrency)-\(targetCurrency)"
    let convertedAmount = Convert(Amount: amount, from: baseCurrency, to:targetCurrency, and:exchangeRates)
    if (convertedAmount == 0.0){
    print("La convertions n'est pas nécessaire puisque la devise de base est la même que celle de cible")
    print("Montant converti : \(amount) \(targetCurrency)")
    }else{
    print("Montant converti : \(convertedAmount) \(targetCurrency)")
  }
    print("_____________________________________________________")

  print("Avez-vous une autre monnaie à convertir ? (O/N) : ")
  let convertAgain = readLine()

    if( convertAgain == "O" || convertAgain == "o"){
       keepOnWholeProgram = true
    }
    if( convertAgain == "N" || convertAgain == "n"){
       keepOnWholeProgram = false
    }
    else{
      print("Veuillez entrer un choix valide ")
       keepOnWholeProgram = true
    }

}while(keepOnWholeProgram)

tinySpace()
print("Merci d'avoir utilisé notre application de conversion de devises. À bientôt !")
