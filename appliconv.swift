// OUR FUNCTIONS
// ==================================================================
func Convert(Amount: Double, from baseCur: String, to targetCur:String) -> Double{
  let exchangeRates = [
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
  let convertKey = "\(baseCur)-\(targetCur)"
  let result = Amount * exchangeRates[convertKey, default: 0.0]

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


func menu(){
  print("\tdevises disponibles")
  mediumDrawLine()
  let exchangeCurrency = [
    "XOF", "EUR", "USD", "LIVRE", "YEN",
  ]
  for i in 1...exchangeCurrency.count{
      print("\t \(i) --> \(exchangeCurrency[i-1])")
  }
}

// MAIN PROGRAM
// =================================================


title()
tinySpace()
menu()
tinySpace()


var keepOnWholeProgram = false
var testAmount = true

repeat{
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
    let convertedAmount = Convert(Amount: amount, from: baseCurrency, to:targetCurrency)
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