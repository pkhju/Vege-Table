function btnClick(clicked_id) { // 하얀 버튼 클릭 시 하얀 버튼 사라지고 검은 버튼 나오게 함
    let btnHeart = document.getElementById(clicked_id); // 하얀 버튼 id의 object 저장
    let blk = "blk";
    btnHeart.style.display = "none";    // 하얀버튼 object 안보이게 함

    let btnBlack = document.getElementById(blk.concat(clicked_id));    // blk id의 object 저장

    btnBlack.style.display = "inline"
}

function btnClickAgain(clicked_id) {
    let btnHeartBlack = document.getElementById(clicked_id);

    btnHeartBlack.style.display = "none";

    let btnHeart = document.getElementById(clicked_id.substring(3));

    btnHeart.style.display = "inline";
}

function comBtn1() {
    let recipe = document.querySelectorAll(".recipe");
    for (var i = 0; i < recipe.length; i++) {
        recipe[i].style.display = "block";
    }
    let veganLife = document.querySelectorAll(".veganLife");
    for (var i = 0; i < veganLife.length; i++) {
        veganLife[i].style.display = "block";
    }
}

function comBtn2() {
    let recipe = document.querySelectorAll(".recipe");
    for (var i = 0; i < recipe.length; i++) {
        recipe[i].style.display = "block";
    }
    let veganLife = document.querySelectorAll(".veganLife");
    for (var i = 0; i < veganLife.length; i++) {
        veganLife[i].style.display = "none";
    }
}

function comBtn3() {
    let recipe = document.querySelectorAll(".recipe");
    for (var i = 0; i < recipe.length; i++) {
        recipe[i].style.display = "none";
    }
    let veganLife = document.querySelectorAll(".veganLife");
    for (var i = 0; i < veganLife.length; i++) {
        veganLife[i].style.display = "block";
    }
}

function submitReply() {
    alert("community.js에서 submitReply 만들어야함");
}