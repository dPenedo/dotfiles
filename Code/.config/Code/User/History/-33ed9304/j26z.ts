//
//  Escribe un programa que muestre cómo transcurre un juego de tenis y quién lo ha ganado.
//  El programa recibirá una secuencia formada por "P1" (Player 1) o "P2" (Player 2), según quien
//  gane cada punto del juego.
//
//  - Las puntuaciones de un juego son "Love" (cero), 15, 30, 40, "Deuce" (empate), ventaja.
//  - Ante la secuencia [P1, P1, P2, P2, P1, P2, P1, P1], el programa mostraría lo siguiente:
//    15 - Love
//    30 - Love
//    30 - 15
//    30 - 30
//    40 - 30
//    Deuce
//    Ventaja P1
//    Ha ganado el P1
//  - Si quieres, puedes controlar errores en la entrada de datos.
//  - Consulta las reglas del juego si tienes dudas sobre el sistema de puntos.
//

const scores = ["Love", "15", "30", "40"];
type Players = "P1" | "P2";


function showResults(score1: string, score2: string) {
    console.log(`Player 1: ${score1} || Player 2: ${score2}`);
    console.log("***********************");
}


function playGame(players: Players[]) {
    let deuce: boolean = false;
    console.log(`Secuencia de juegos ganados: ${players}`);
    let countP1 = 0;
    let countP2 = 0;

    for (let index = 0; index < players.length; index++) {
        const player = players[index];
        if (player == "P1") {
            console.log("Point for Player 1");
            countP1++;
        } else if (player == "P2") {
            console.log("Point for Player 2");
            countP2++;
        }
        if (countP1 >= 3 && countP2 >= 3 && countP1 === countP2) {
            deuce = true;
            console.log("Deuce");
        } else if (deuce) {
            let difference = countP1 - countP2;
            if (difference >= 2) {
                console.log("Victory for Player 1");
                break;
            } else if (difference >= -2) {
                console.log("Victory for Player 2");
                break;
            } else if (difference === 1) {
                console.log("Advantage for Player 1 ");
                countP1++;
            } else if (difference === -1) {
                console.log("Advantage for Player 2 ");
                countP2++;

            }

        } else {
            showResults(scores[countP1], scores[countP2]);
        }


    }
}

let secuence: Players[] = ["P1", "P1", "P1", "P2", "P2", "P2", "P1", "P1"];
playGame(secuence);
