// Escribe un programa que, dado un número, compruebe y muestre si es primo, fibonacci y par.
// Ejemplos:
// - Con el número 2, nos dirá: "2 es primo, fibonacci y es par"
// - Con el número 7, nos dirá: "7 es primo, no es fibonacci y es impar"

function isPair(numberToCheck) {
    return (numberToCheck % 2 === 0);
}

function isSquare(numberToCheck) {
    let square = parseInt(Math.sqrt(numberToCheck));
    return (square * square == numberToCheck);
}

function isFibonacci(numberToCheck) {
    return isSquare(5 * numberToCheck * numberToCheck + 4) || isSquare(5 * numberToCheck * numberToCheck - 4);
}

function isPrime(numberToCheck) {
    if (numberToCheck > 1) {
        for (let i = 2; i < numberToCheck; i++) {
            if (numberToCheck % i == 0) {
                return false;
            }
        }
        return true;
    }
    return false;
}


function numberChecker(numberToCheck) {
    let pairText = "not pair";
    let fibonacciText = "not Fibonacci";
    let primeText = "not prime";
    if (isPair(numberToCheck)) {
        pairText = "pair";
    }
    if (isFibonacci(numberToCheck)) {
        fibonacciText = "Fibonacci";
    }
    if (isPrime(numberToCheck)) {
        primeText = "prime";
    }


    console.log(`Your given number: ${numberToCheck}, is ${pairText}, ${fibonacciText} and ${primeText}`);
}

numberChecker(5);
numberChecker(2);
numberChecker(12);
// test
console.log(isPrime(1));
console.log(isPrime(2));
console.log(isPrime(3));
console.log(isPrime(7));
console.log(isPrime(8));