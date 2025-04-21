
//menu nav
const body = document.querySelector('body'),
    navMenu = body.querySelector('.menu-content'),
    navclosebtn = body.querySelector('.navclose-btn'),
    navopenbtn = body.querySelector('.navopen-btn');

if(navMenu && navopenbtn){
    navopenbtn.addEventListener('click', () => {
        navMenu.classList.add('open');
        body.style.overflowY = 'hidden';
    });
    
}
if(navMenu && navclosebtn){
    navclosebtn.addEventListener('click', () => {
        navMenu.classList.remove('open');
        body.style.overflowY = 'scroll';
    });
    
}