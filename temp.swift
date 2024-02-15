
// Sujet : Création d’une application de conversion de devises
// Description : Votre tâche consiste à concevoir et développer une application de conversion de devises en utilisant le langage Swift. L’application doit permettre aux utilisateurs de saisir un montant dans une devise de base (par exemple, l’euro ou le dollar) et de le convertir dans une autre devise (par exemple, le yen japonais ou la livre sterling). Voici les fonctionnalités minimales attendues :
// Sélection des devises :
// Afficher une liste de devises disponibles (par exemple, EUR, USD, JPY, GBP). --> OK
// Permettre à l’utilisateur de sélectionner une devise de base et une devise cible. --> OK
// Conversion de devises :
// Demander à l’utilisateur de saisir un montant dans la devise de base. --> OK
// Convertir ce montant dans la devise cible en utilisant des taux de change réalistes (vous pouvez simuler ces taux).
// Affichage des résultats :
// Afficher le montant converti dans la devise cible.



// OUR FUNCTIONS
// ==================================================================
func Convert(Amount: Double, from baseCur: String, to targetCur:String) -> Double{
  let exchangeRates = [
    "USD-EUR":  0.93, 
    "USD-LIVRE":  0.80, 
    "USD-FR":  611.42,
    "USD-YEN":  150.05, 

    "EUR-USD":  1.07, 
    "EUR-LIVRE":  0.86, 
    "EUR-YEN":  1.07, 
    "EUR-FR":  656.39, 

    "LIVRE-USD":  1.25,
    "LIVRE-EUR":  1.17,
    "LIVRE-YEN":  188.26,
    "LIVRE-FR":  767.24,

    "YEN-USD":  0.0067,
    "YEN-EUR":  0.0062,
    "YEN-LIVRE":  0.0053,
    "YEN-FR":  4.07,

    "FR-USD":  0.0016,
    "FR-EUR":  0.0015,
    "FR-LIVRE":  0.0013,
    "FR-YEN":  0.25
  ]
  let convertKey = "\(baseCur)-\(targetCur)"
  return Amount * exchangeRates[convertKey, default: 0.0]
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
  let exchangeCurrency = [
    "FR", "EUR", "USD", "LIVRE", "YEN",
  ]
  for i in 1...exchangeCurrency.count{
      print("\(i) --> \(exchangeCurrency[i-1])")
  }
}
// =================================================

title()
tinySpace()
menu()
tinySpace()

print("\tdevises disponibles")
mediumDrawLine()
tinySpace()


print("Selectionner la devise de base (1 pour XOF) :")
var baseCurrency = "FR";
var targetCurrency = "FR";

let userBaseCurrency = readLine()

switch (userBaseCurrency)  {
  case "1":
    baseCurrency = "FR" 
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
   print("Oops, désolé votre choix est incorrect")
}

print("Selectionner la devise cible (1 pour XOF):")
let userTargetCurrency = readLine()
switch (userTargetCurrency)  {
  case "1":
    targetCurrency = "FR" 
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
   print("Oops, désolé votre choix est incorrect")
}



print("Entrer le montant à convertir dans la devise de base:")
let amount = Double(readLine()!)!

tinySpace()
print("_____________________________________________________")
print("Vos différentes selections")
print("_____________________________________________________ ")
tinySpace()
print("Devise de base : \(baseCurrency) & Devise cible : \(targetCurrency)")
print("Type de conversion: \(baseCurrency) --> \(targetCurrency)")
print("Montant à convertir : \(amount) \(baseCurrency)")


let convertKey = "\(baseCurrency)-\(targetCurrency)"
let convertedAmount = Convert(Amount: amount, from: baseCurrency, to:targetCurrency)

print("Montant converti : \(convertedAmount) \((targetCurrency))")
print("_____________________________________________________")


