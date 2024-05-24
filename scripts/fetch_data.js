$(document).ready(() => {
 const URL = 'http://127.0.0.1:3000/';

	$.ajax({
  	url: URL,
  	type: 'GET',
  	xhrFields: {
    	withCredentials: true // Send credentials with the request
  	},
  	success: function(data) {
    	if (data.status === 'success') {
      	handleProducts(data);
    	} else {
      	console.log('Error fetching data');
    	}
  	},
  	error: function(xhr, status, error) {
    	console.error('Request failed:', status, error);
  	}
	});
 
  function handleProducts(data) {
    const productsGrid = document.querySelector('#products-grid_id');
    data.forEach(product => {
      handleProduct(product, productsGrid);
    });
  };

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
  };
});
