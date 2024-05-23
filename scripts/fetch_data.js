<script>
// module queries an api for data and makes an html page
// dynamically with the data

document.addEventListener('DOMContentLoaded', function() {
  const url = 'https://localhost:3000/';

  // get the data from the api and then display it in the different html tags and classes 
  fetch(url)
    .then(response => {
      if (response.status !== 200) {
        console.log(`There was a problem. Status Code: ${response.status}`);
        return;
      } else {
        return response.json();
      }
    })
    .then(data => {
      handleProducts(data);
    })
    .catch(error => {
      console.error('Error:', error);
    });

  function handleProducts(data) {
    if (data !== null) {
      const productsGrid = document.querySelector('#products-grid');
      data.forEach(product => {
        handleProduct(product, productsGrid);
      });
    };
  };

  function handleProduct(product, productsGrid) {
    const productDiv = document.createElement('div');

    productDiv.setAttribute('class', 'product-shop_link');
    // gets the first image in the list
    // product.images and makes a corresponding src
    const image = document.createElement('img');
    image.setAttribute('src', product.images[0].image_url);
    image.setAttribute('class', 'product_image');
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
  };

  request.send()
});

</script>


