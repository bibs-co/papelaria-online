const cart = document.getElementById('shopping-cart');
const cartItems = document.getElementById('cart-items');
const closeCartBtn = document.getElementById('close-cart');
const cartIcons = document.querySelectorAll('.pro-cart');
const cartNavIcon = document.querySelector('.cart-icon');
const cartTotal = document.getElementById('cart-total');

let cartData = [];

cartNavIcon.addEventListener('click', () => {
    cart.classList.add('open');
    document.body.style.overflowY = 'hidden';
});

closeCartBtn.addEventListener('click', () => {
    cart.classList.remove('open');
    document.body.style.overflowY = 'scroll';
});

cartIcons.forEach(icon => {
    icon.addEventListener('click', (e) => {
        e.preventDefault();

        if (icon.getAttribute('data-logged') !== 'false') {
            alert('Você precisa estar logado para adicionar itens ao carrinho!');
            window.location.href = 'Views/login.jsp';
            return;
        }

        // Se o usuário estiver logado, prossegue com a adição do item
        const product = icon.closest('.pro');
        const productId = product.id;
        const productName = product.querySelector('h5').textContent;
        const productType = product.querySelector('span').textContent;
        const productPrice = parseFloat(product.querySelector('h4').textContent.replace('R$', '').replace(',', '.'));
        const productImage = product.querySelector('img').src;

        const existingProduct = cartData.find(item => item.id === productId);
        if (existingProduct) {
            existingProduct.quantity += 1;
        } else {
            cartData.push({
                id: productId,
                type: productType,
                name: productName,
                price: productPrice,
                image: productImage,
                quantity: 1
            });
        }

        updateCartUI();
        cart.classList.add('open');
        document.body.style.overflowY = 'hidden';
    });
});

function updateCartUI() {
    cartItems.innerHTML = '';
    let total = 0;

    cartData.forEach(item => {
        total += item.price * item.quantity;

        const cartItem = document.createElement('li');
        cartItem.classList.add('cart-item');
        cartItem.innerHTML = `
            <img src="${item.image}" alt="${item.name}" class="cart-item-image">
            <div class="cart-item-details">
                <h6>${item.type}</h6>
                <h4>${item.name}</h4>
                <p>R$${item.price.toFixed(2)}</p>
                <div class="cart-item-quantity">
                    <button class="quantity-btn decrease" data-id="${item.id}">-</button>
                    <span>${item.quantity}</span>
                    <button class="quantity-btn increase" data-id="${item.id}">+</button>
                </div>
            </div>
            <button class="remove-item" data-id="${item.id}"><i class="bx bx-x"></i></button>
        `;
        cartItems.appendChild(cartItem);
    });

    cartTotal.textContent = `R$${total.toFixed(2)}`;

    document.querySelectorAll('.quantity-btn').forEach(btn => {
        btn.addEventListener('click', handleQuantityChange);
    });

    document.querySelectorAll('.remove-item').forEach(btn => {
        btn.addEventListener('click', handleRemoveItem);
    });
}

function handleQuantityChange(e) {
    const productId = e.target.dataset.id;
    const product = cartData.find(item => item.id === productId);

    if (e.target.classList.contains('increase')) {
        product.quantity += 1;
    } else if (e.target.classList.contains('decrease')) {
        product.quantity -= 1;
        if (product.quantity === 0) {
            cartData = cartData.filter(item => item.id !== productId);
        }
    }

    updateCartUI();
}

function handleRemoveItem(e) {
    const productId = e.target.dataset.id;
    cartData = cartData.filter(item => item.id !== productId);
    updateCartUI();
}

const finalizeBtn = document.querySelector('.cart-footer .finalize-btn');

finalizeBtn.addEventListener('click', (e) => {
    e.preventDefault();

    // Verifica se há itens no carrinho, senão ele não deixa prosseguir e encaminha para o login
    if (cartData.length === 0) {
        alert("nenhum item adicionado no carrinho. Por favor, adicione ao menos um item para finalizar a compra.");
        return;
    }
    
    // Se houver itens, segue para finalizar a compra redirecionando para compa.jsp
    window.location.href = "Views/compra.jsp";

});

