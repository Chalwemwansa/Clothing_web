document.addEventListener('DOMContentLoaded', function() {
  const url = 'https://127.0.0.1:3000/product/4';

  const xhr = new XMLHttpRequest();
  xhr.open('GET', url, true);

  xhr.onload = function() {
    if (xhr.status >= 200 && xhr.status < 300) {
      const data = JSON.parse(xhr.responseText);
      handleProducts(data);
    } else {
      console.error('Error:', xhr.statusText);
    }
  };

  xhr.onerror = function() {
    console.error('Request failed');
  };

  xhr.send(); // Initiate the request

  function handleProducts(data) {
    const productsGrid = document.querySelector('#products-grid');
    data.forEach(product => {
      handleProduct(product, productsGrid);
    });
  }

  function handleProduct(product, productsGrid) {
    const productDiv = document.createElement('div');
    productDiv.classList.add('product-shop_link');

    // Get the first image in the list from product.images and set its corresponding src
    const image = document.createElement('img');
    image.src = product.images[0].image_url;
    image.classList.add('product_image');
    productDiv.appendChild(image);

    const productName = document.createElement('p');
    productName.textContent = product.name;
    productName.classList.add('product_text', 'text-size-medium', 'text-weight-bold', 'text-style-allcaps');
    productDiv.appendChild(productName);

    const productPrice = document.createElement('p');
    productPrice.textContent = product.price;
    productPrice.classList.add('product_text', 'text-size-medium', 'text-weight-bold');
    productDiv.appendChild(productPrice);

    productsGrid.appendChild(productDiv);
  }
});

