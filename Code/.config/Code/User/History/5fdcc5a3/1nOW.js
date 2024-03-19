// Escribe un programa que, dado un número, compruebe y muestre si es primo, fibonacci y par.
// Ejemplos:
// - Con el número 2, nos dirá: "2 es primo, fibonacci y es par"
// - Con el número 7, nos dirá: "7 es primo, no es fibonacci y es impar"

function isPair(numberToCheck) {
    if (numberToCheck % 2 === 0) {
        return True;
    } else {
        return False;
    }
}


function numberChecker(numberToCheck) {
    let pairText = "not pair";
    let fibonacciText = "not Fibonacci";
    let primeText = "not prime";
    if (isPair(numberToCheck)) {
        pairText = "pair";
    }


    console.log(`Your given number, ${numberToCheck}, is ${pairText}, ${fibonacciText} and ${primeText}`);
}

numberChecker(5);
numberChecker(2);
numberChecker(12);