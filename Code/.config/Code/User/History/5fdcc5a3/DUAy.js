// Escribe un programa que, dado un número, compruebe y muestre si es primo, fibonacci y par.
// Ejemplos:
// - Con el número 2, nos dirá: "2 es primo, fibonacci y es par"
// - Con el número 7, nos dirá: "7 es primo, no es fibonacci y es impar"

function isPair(numberToCheck) {
    if (numberToCheck % 2 === 0) {
        return true;
    } else {
        return false;
    }
}

function isSquare(numberToCheck) {
    let square = parseInt(Math.sqrt(numberToCheck));
    return (square * square == numberToCheck);
}

function isFibonacci(numberToCheck) {
}

function isPrime(numberToCheck) {
}


function numberChecker(numberToCheck) {
    let pairText = "not pair";
    let fibonacciText = "not Fibonacci";
    let primeText = "not prime";
    if (isPair(numberToCheck)) {
        pairText = "pair";
    }
    if (isFibonacci(numberToCheck)) {
        fibonacciText = "pair";
    }
    if (isPrime(numberToCheck)) {
        primeText = "pair";
    }


    console.log(`Your given number, ${numberToCheck}, is ${pairText}, ${fibonacciText} and ${primeText}`);
}

numberChecker(5);
numberChecker(2);
numberChecker(12);
console.log(isSquare(2));
console.log(isSquare(16));
console.log(isSquare(3));