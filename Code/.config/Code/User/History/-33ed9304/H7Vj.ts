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


function showResults(score1, score2) {
    console.log(`Player 1: ${score1} || Player 2: ${score2}`);
}


function playGame(players: Players[]) {
    let deuce: boolean = false;
    console.log(`Secuencia de juegos ganados: ${players}`);
    let countP2 = 0;
    let countP1 = 0;
    for (let index = 0; index < players.length; index++) {
        const player = players[index];
        if (!deuce) {
            if (player == "P1" && scores[countP2] !== "40") {
                console.log("Point for Player 1");
                countP2++;
            } else if (player == "P2" && scores[countP1] !== "40") {
                console.log("Point for Player 2");
                countP1++;
            }
            console.log(
                "Player 1: " +
                scores[countP2] +
                " || Player 2: " +
                scores[countP1],
            );
        }
        if (scores[countP2] == "40" && scores[countP1] == "40" || deuce && scores[countP2] == scores[countP1]) {
            deuce = true;
            console.log("Deuce");
        }
        if (deuce && player == "P1") {
            if (countP1 - countP2 >= 2) {
                console.log("Victory for Player 1");
                break;
            } else {
                console.log("Advantage for Player 1");
                countP1++;
            }
        } else {
            if (countP2 - countP1 >= 2) {
                console.log("Victory for Player 2");
                break;
            } else {
                console.log("Advantage for Player 2");
                countP2++;

            }
        }
    }
}

let secuence: Players[] = ["P1", "P2", "P1", "P2", "P1", "P2", "P1", "P1"];
playGame(secuence);
