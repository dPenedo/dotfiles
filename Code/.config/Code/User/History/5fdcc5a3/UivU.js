// Escribe un programa que, dado un número, compruebe y muestre si es primo, fibonacci y par.
// Ejemplos:
// - Con el número 2, nos dirá: "2 es primo, fibonacci y es par"
// - Con el número 7, nos dirá: "7 es primo, no es fibonacci y es impar"

function numberChecker(numberToCheck) {
    let pairText = "not pair";
    let fibonacciText = "not Fibonacci";
    let primeText = "not prime";
    if (numberToCheck % 2 === 0) {
        pairText = "pair";
    }
    console.log(`Your given number, ${numberToCheck}, is ${pairText}, ${fibonacciText} and ${primeText}`);
}

numberChecker;