function updateTime() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const milliseconds = String(now.getMilliseconds()).padStart(3, '0');

    document.querySelector('.clock__hours').textContent = hours;
    document.querySelector('.clock__min').textContent = minutes;
    document.querySelector('.clock__sec').textContent = seconds;
    document.querySelector('.clock__millisec').textContent = milliseconds;
}

// Actualizar la hora cada 100 milisegundos (para mostrar milisegundos)
setInterval(updateTime, 100);

// Obtener la hora por primera vez
updateTime();