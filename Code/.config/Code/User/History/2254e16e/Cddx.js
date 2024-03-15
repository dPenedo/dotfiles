document.addEventListener('DOMContentLoaded', function () {
    if (!localStorage.getItem('counter')) {
        localStorage.setItem('counter', 0);
    } else {
        counted = localStorage.getItem('counter');
        document.querySelector('#sec').innerHTML = counted;
    }


    function count() {
        let counter = localStorage.getItem('counter');
        counter++;
        document.querySelector('#sec').innerHTML = counter;
        localStorage.setItem('counter', counter);
    }
    document.querySelector('#count').onclick = count;
});