window.onload = function () {
     let box_search = document.querySelectorAll('.box_search');
     let btn_exit = document.querySelectorAll('.btn_exit');

     let box_searchEmail = document.getElementById('box_searchEmail');
     let box_searchPwd = document.getElementById('box_searchPwd');
     let btn_searchEmail = document.getElementById('btn_searchEmail');
     let btn_searchPwd = document.getElementById('btn_searchPwd');

     for ( let i = 0; i < box_search.length; i++ ) {
          box_search[i].style.display = 'none';
     }
     for ( let i = 0; i < btn_exit.length; i++ ) {
          btn_exit[i].addEventListener('click',closeModal);
     }

     btn_searchEmail.addEventListener('click',showModal);
     btn_searchPwd.addEventListener('click',showModal);

     function showModal (event) {                     
          if ( event.target.innerText == '이메일 찾기' ) {
            box_searchEmail.style.display = 'block';
			box_searchPwd.style.display = 'none';
          } else if ( event.target.innerText == '비밀번호 찾기' ) {
            box_searchPwd.style.display = 'block';
			box_searchEmail.style.display = 'none';
          }
     }

     function closeModal () {
          this.parentElement.style.display = 'none';   
      }
}