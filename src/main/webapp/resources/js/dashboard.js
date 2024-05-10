let items = document.querySelectorAll('.slider .item');

function adjustLeftPosition() {
let parentWidth = items[0].parentElement.offsetWidth;
let itemWidth = items[0].offsetWidth; // 첫 번째 아이템의 너비 가져오기
let leftPosition = (parentWidth / 2) - (itemWidth / 2); // left 위치 계산
items.forEach(item => {
item.style.left = leftPosition + 'px'; // 모든 아이템에 left 위치 적용
    });
}

// 페이지 로드 후와 창 크기가 변경될 때마다 left 위치 조정
let active = 2;
function loadShow() {
    items[active].style.transform = `none`;
    items[active].style.zIndex = 1;
    items[active].style.filter = 'none';
    items[active].style.opacity = 1;
    // show after
    let stt = 0;
    for (var i = active + 1; i < items.length; i++) {
        stt++;
        items[i].style.transform = `translateX(${70 * stt}%) scale(${1 - 0.2 * stt}) perspective(16px) rotateY(-1deg)`;
        items[i].style.zIndex = -stt;
        items[i].style.filter = 'blur(5px)';
        items[i].style.opacity = stt > 2 ? 0 : 0.6;
    }
    stt = 0;
    for (var i = (active - 1); i >= 0; i--) {
        stt++;
        items[i].style.transform = `translateX(${-70 * stt}%) scale(${1 - 0.2 * stt}) perspective(16px) rotateY(1deg)`;
        items[i].style.zIndex = -stt;
        items[i].style.filter = 'blur(5px)';
        items[i].style.opacity = stt > 2 ? 0 : 0.6;
    }
}
loadShow();
let next = document.getElementById('next');
let prev = document.getElementById('prev');
next.onclick = function () {
    active = active + 1 < items.length ? active + 1 : active;
    loadShow();
}
prev.onclick = function () {
    active = active - 1 >= 0 ? active - 1 : active;
    loadShow();
}