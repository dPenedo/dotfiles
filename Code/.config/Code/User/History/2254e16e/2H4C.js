if (!localStorage.getItem('counter')) {
    localStorage.setItem('counter', 0);
}



let counter = 0;

function count() {
    counter++;
    document.querySelector('#sec').innerHTML = counter;
}
document.addEventListener('DOMContentLoaded', function () {
    document.querySelector('#count').onclick = count;
    setInterval(count, 1000);
});