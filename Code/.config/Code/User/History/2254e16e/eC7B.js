if (!localStorage.getItem('counter')) {
    localStorage.setItem('counter', 0);
} else {
    counted = localStorage.getItem('counter');
    localStorage.setItem('counter', counted);
    console.log(counted);
}


function count() {
    let counter = localStorage.getItem('counter');
    counter++;
    document.querySelector('#sec').innerHTML = counter;
    localStorage.setItem('counter', counter);
}
document.addEventListener('DOMContentLoaded', function () {
    document.querySelector('#count').onclick = count;
});