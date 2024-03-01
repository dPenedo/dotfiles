// /
//   Escribe un programa que muestre por consola (con un print) los
//   números de 1 a 100 (ambos incluidos y con un salto de línea entre
//   cada impresión), sustituyendo los siguientes:
//   - Múltiplos de 3 por la palabra "fizz".
//   - Múltiplos de 5 por la palabra "buzz".
//   - Múltiplos de 3 y de 5 a la vez por la palabra "fizzbuzz".
//  

function isMultiple(number, divider){
    return number % divider == 0
}


function printNumbers(number){
    const listNumber = number
    for (let index = 0; index <= listNumber; index++) {
        const multipleOf3 = isMultiple(index, 3) 
        if (multipleOf3){
            console.log("fizz")
        }
        else{
            console.log(index)
        }
    }
}

// printNumbers(100)
console.log(isMultiple(4, 3))