class dica {
  static showPasswordCriteria() {
    const el = document.getElementById("passwordCriteria");
    if (el) {
      el.style.display = "block";
    }
  }
  
  static hidePasswordCriteria() {
    const el = document.getElementById("passwordCriteria");
    if (el) {
      el.style.display = "none";
    }
  }
}

class CadastroValidator {
  static checkPasswordMatch() {
    const senhaInput = document.getElementsByName("senha")[0];
    const senhaRepeatInput = document.getElementsByName("senhaRepeat")[0];
    
    if (senhaInput.value !== senhaRepeatInput.value) {
      senhaRepeatInput.setCustomValidity("As senhas não conferem!");
    } else {
      senhaRepeatInput.setCustomValidity("");
    }
  }
}

document.addEventListener("DOMContentLoaded", function () {
  const senhaRepeatInput = document.getElementsByName("senhaRepeat")[0];
  if (senhaRepeatInput) {
    senhaRepeatInput.addEventListener("input", CadastroValidator.checkPasswordMatch);
  }
  
  const form = document.getElementById("cadastroForm");
  if (form) {
    form.addEventListener("submit", function () {
      CadastroValidator.checkPasswordMatch();
    });
  }
});
