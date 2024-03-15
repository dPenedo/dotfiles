document.addEventListener('DOMContentLoaded', function () {
    let counter = 0;

    const secondsDisplay = document.querySelector('#sec');
    const countButton = document.querySelector('#playPause');

    function count() {
        secondsDisplay.innerHTML = counter;
        counter++;
    }
    document.addEventListener('DOMContentLoaded', function () {
        countButton.onclick = count;
        setInterval(count, 1000);
    });
});